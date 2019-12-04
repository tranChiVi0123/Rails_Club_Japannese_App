class SearchJqueryController < ApplicationController
    skip_before_action :verify_authenticity_token
    def getQuestion
        key = params[:key]
        render :json => Question.ransack(content_cont: key).result.select("id", "content").to_json
    end
end
