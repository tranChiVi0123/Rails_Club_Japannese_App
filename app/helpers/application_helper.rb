require 'redcarpet'
include Clearance::Controller
module ApplicationHelper
    include Clearance::Controller

    #Convert markdown to HTML
    def markdown(text)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
            no_intra_emphasis: true,
            fenced_code_blocks: true,
            disable_indented_code_blocks: true,
            autolink: true,
            tables: true,
            underline: true,
            highlight: true
           )
            return markdown.render(text).html_safe
    end


    def isPostOwner(post_id)
        if signed_in?
            if current_user.id != post_id
                return false
            else
                return true
            end
        else
            return false
        end
    end
    
    def isSessionMembers(test_session)
        if signed_in?
            return SessionMember.where(user_id: current_user.id, test_session_id: test_session.id).exists?
        else
            return false
        end
    end

    def allow_examination(test_session)
        if isSessionMembers(test_session)
            public_time = test_session.time_public.utc
            current_time = Time.now.utc
            finish_time = (current_time - public_time)/60
            if( finish_time <= test_session.time_remaining && finish_time >=0)
                return true
            else
                return false
            end
        else
            return false
        end
    end

    def allow_examinations
        if isSessionMember
            public_time = @test_session.time_public.utc
            current_time = Time.now.utc
            finish_time = (current_time - public_time)/60
            if( finish_time <= @test_session.time_remaining && finish_time >=0)
                return true
            else
                return false
            end
        else
            return false
        end
    end

    def isSessionMember
        if signed_in?
            return SessionMember.where(user_id: current_user.id, test_session_id: @test_session.id).exists?
        else
            return false
        end
    end


    def timePickerToDateTime(time)
        Time.strptime(time, "%m/%d/%Y %I:%M %p")
    end

    def dateTimeToTimePicker(datetime)
        datetime.strftime("%m/%d/%Y %I:%M %p")
    end

    def optionsForm(form, ops)
        a = ("<input type=\"hidden\" name=\"#{form}[options]\" id=\"options_form\" value=\"#{ops}\">").html_safe
    end

    def csrf
        hidden_field_tag :authenticity_token, form_authenticity_token
    end
    

    def isAdmin
        if signed_in? == false
            return false
        else
            current_user.role == 2 ? true : false
        end
    end
    
    def checkAuth
        if signed_in?
            isAdmin ? true : false
        else 
            redirect_to sign_in_path
            return false
        end
    end

    def require_signed
        if signed_in? == false
            redirect_to sign_in_path
        end

    end
end
