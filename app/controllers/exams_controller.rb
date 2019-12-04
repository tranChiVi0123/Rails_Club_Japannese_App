class ExamsController < ApplicationController
    include Clearance::Controller
    include ApplicationHelper

    before_action :ifNotAdmin

    def index
        @title = "Exams"
        @exams = Exam.last(30).reverse
    end

    def new
    end

    def show
    end

    def create   
        pars = params[:exam]
        puts(pars)
        list_questions = pars[:list_questions].split("\r\n").map{|tag| tag.strip}.join(",")
        idC = Category.find_by(title:pars[:category])
        #puts(idC.id)
        #puts(current_user.id)
        Exam.create(title: pars[:title], list_questions: list_questions, category_id: idC.id, user_id:current_user.id)
        redirect_to '/exams'
    end
    
    def update
        pars = params[:exam]
        list_questions = pars[:list_questions].split("\r\n").map{|tag| tag.strip}.join(",")
        Exam.find(pars[:id].to_i).update_attributes(title: pars[:title], category_id: Category.find_by(title: pars[:category]).id, list_questions: list_questions)
    end
    

    def edit
        @title = "Edit exam"
        @exam = Exam.find(params[:id])
    end

    def ifNotAdmin
        if checkAuth == false
            redirect_to home_path
        end
    end
end
