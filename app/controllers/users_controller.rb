class UsersController < ApplicationController
    include ApplicationHelper
    before_action :require_signed, except: [:show]

    def show
        @title = current_user.email
        @user = User.find(params[:id])
        render "guest"
    end

    def home
        @title = "Profiles"
        @user = current_user
        @test_session_results = []
            @user.session_members.ids.each do |session_members_id|
                @test_session_results.push(SessionMember.find(session_members_id).test_session)
            end
        @post_results = @user.posts
        render 'home'
    end

    def update
        pars = params[:user]
        current_user.update_attributes(name: pars[:name])
        if pars[:password].blank? == false
            current_user.update_password(pars[:password])
        end
    end
end
