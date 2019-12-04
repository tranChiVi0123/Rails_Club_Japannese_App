class PostsController < ApplicationController
    include ApplicationHelper
    def helpmarkdown
        render '/posts/helpmarkdown.text.erb', layout: false, content_type: 'text/plain'
    end

    def howtomarkdown
        @title = "How to using markdown"
    end

    def markdown
        @post = Post.find_by_id(params[:id])
        render plain: @post.content
    end
    

    def index
        @title = "Posts"
        @posts = Post.last(12).reverse
    end

    def show
        @post = Post.find(params[:id])
        @title = @post.user.name + "View post"
        @url = "unil"
    end

    def update
        if signed_in?
            pars = params[:posts]
            post_content = pars[:content].sub! "\r\n", "\n"
            #post_tags = pars[:tags].gsub! " ", ""
            post_tags = pars[:tags].split(",").map{|tag| tag.strip}.join(",")
            if current_user.posts.create(title: pars[:title], content: pars[:content], tags: post_tags, category_id: 1)
                redirect_to posts_path
            else
                redirect_to home_path
            end
        else
            redirect_to home_path
        end
    end

    def edit
        id = params[:id].to_i
        @post = Post.find(id)
        if signed_in?
            if isPostOwner(id)
                render "edit"
            end
        else
            redirect_to home_path
        end
    end

    def new
        if signed_in?
            @title = "Create new post"
            render "new"
        else
            redirect_to home_path
        end
    end

    def create
        if signed_in?
            pars = params[:posts]
            post_content = pars[:content].sub! "\r\n", "\n"
            #post_tags = pars[:tags].gsub! " ", ""
            post_tags = pars[:tags].split(",").map{|tag| tag.strip}.join(",")
            if current_user.posts.create(title: pars[:title], content: pars[:content], tags: post_tags, category_id: 1)
                redirect_to posts_path
            else
                redirect_to home_path
            end
        else
            redirect_to home_path
        end
    end

    def destroy
    end
end
