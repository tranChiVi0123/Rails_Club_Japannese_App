class TestPapersController < ApplicationController
    include Clearance::Controller
    skip_before_action :verify_authenticity_token
    def toHome
        redirect_to home_path
    end


    def show
        @title = Exam 
        @test_session_id = TestPaper.where(user_id: current_user.id).last.test_session_id

        @timeRemaining = 0
        if allow_examinations
            if TestPaper.where(user_id: current_user.id, test_session_id: @test_session_id).last.point != nil 
                redirect_to  '/users/home'
            else
                public_time = TestSession.find(@test_session_id).time_public.utc
                current_time = Time.now.utc
                ts = TestSession.find(@test_session_id).time_remaining*60
                time = ts.to_i-(current_time-public_time).to_i
                @timeRemaining = time
            end
        else
            redirect_to home_path
        end
    end

    def allow_examinations
        if signed_in?
            if SessionMember.where(user_id: current_user.id, test_session_id: @test_session_id).exists?
                return true
            else
                return false
            end
        else
            return false
        end
    end

    def create
       redirect_to home_path
    end

    def final
        arrayAnswer = params[:answers]
        tsid = TestPaper.last.test_session_id
        ts = TestSession.find(tsid)
        _exam_ids = ts.exams.ids 
        list_questionID = []
        _exam_ids.each do |id|
            list_temp = Exam.find(id).list_questions.split(",")
            list_questionID.concat list_temp
        end

        list_anwsers = []
        list_questionID.each do |li|
            temp = li.to_i
            list_anwsers.push(Question.find(temp).key)
        end
        numCorrect = 0
        i = 0 
        while i < arrayAnswer.length
            if arrayAnswer[i]== list_anwsers[i]
                numCorrect+=1
            end
            i+=1
        end
        tp = TestPaper.where(user_id:current_user.id,test_session_id:tsid)
        tp.update(content:arrayAnswer,point:numCorrect)

        redirect_to  home_path
    end
end
