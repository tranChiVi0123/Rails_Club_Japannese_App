class HomeController < ApplicationController
    def show
        @title = "Home"
        @posts = Post.last(8).reverse
        @test_sessions = TestSession.last(12).reverse
    end
end
