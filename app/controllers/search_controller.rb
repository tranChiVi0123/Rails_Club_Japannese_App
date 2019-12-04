class SearchController < ApplicationController
    def index
        @title = "Search"
        pars = params[:home]
        key = pars[:key]
        @test_session_results = TestSession.ransack(content_cont: key).result
        @post_results = Post.ransack(title_cont: key).result
        @user_results = User.ransack(email_or_name_cont: key).result
        @no_results = @test_session_results.count + @post_results.count + @user_results.count
      end
end
