class TestSessionsController < ApplicationController
    include ApplicationHelper
    def index
        @title = "Test Sessions"
        @test_sessions = TestSession.last(18).reverse
    end

    def show
        @test_session = TestSession.find(params[:id])
        @title = @test_session.content
    end

    def edit
        if isAdmin
            @test_session = TestSession.find(params[:id])
            @title = @test_session.content + " edit"
            @time_public = dateTimeToTimePicker(@test_session.time_public)
        else
            redirect_to home_path
        end
    end

    def new
        if isAdmin
            @title = " Create new Test Session"
        else
            redirect_to home_path
        end
    end


    def update
        if checkAuth
            pars = params[:session]
            ts = TestSession.find(pars[:id])
            if pars[:submit] == "delete"
                TestSession.find(pars[:id]).destroy
                redirect_to home_path
            else            
                case pars[:options]
                when "properties"
                    ts.update_attributes(content: pars[:content], user_id: User.find_by(email: pars[:user]).id, time_remaining: pars[:time_remaining], time_public: timePickerToDateTime(pars[:time_public]))
                when "exams"
                    list_exams = pars[:list_exams].split("\r\n")
                    TestSession.find(ts.id).exams.destroy_all
                    list_exams.each do |title|
                        temp5 = Exam.find_by(title: title).id
                        TestExam.create(test_session_id: ts.id, exam_id: temp5)
                    end
                when "members"
                    emails = pars[:list_members].split("\r\n")
                    sm = ts.session_members.destroy_all
                    emails.each do |email|
                        SessionMember.create(user_id: User.find_by(email: email).id, test_session_id: ts.id)
                        #add_feature=> try-catch if User (:email) not found
                    end
                end
            end
        end
    end

    def create
        if isAdmin
            pars = params[:session]
            le = pars[:list_exams].split("\r\n")
            lm = pars[:list_members].split("\r\n")
            u = current_user.test_sessions.create(content: pars[:content], time_public: timePickerToDateTime(pars[:time_public]), time_remaining: pars[:time_remaining], category_id: pars[:category_id].to_i)
            le.each do |title|
                TestExam.create(test_session_id: u.id, exam_id: Exam.find_by(title: title).id)    
            end
            lm.each do |email|
                SessionMember.create(user_id: User.find_by(email: email).id, test_session_id: u.id)
            end
            redirect_to '/test_sessions'
        else
            redirect_to home_path
        end
    end

    def destroy
    end

    def create_test_paper
        pars = params[:session]
        @test_session = TestSession.find(pars[:submit])
        if allow_examinations
            if(TestPaper.where(test_session_id: @test_session.id, user_id: current_user.id).empty? == false)
                if TestPaper.where(user_id: current_user.id, test_session_id: @test_session.id).last.point != nil 
                    redirect_to  '/users/home'
                else
                    tp = TestPaper.where(test_session_id: @test_session.id, user_id: current_user.id)
                    tp.update(content:"",point: nil)
                    redirect_to test_papers_page_path
                end
            else
                TestPaper.create(exam_id: pars[:submit].to_i, test_session_id: @test_session.id, category_id: @test_session.category.id, user_id: current_user.id)
                redirect_to test_papers_page_path
            end
            
        else
            redirect_to home_path
        end
    end
end
