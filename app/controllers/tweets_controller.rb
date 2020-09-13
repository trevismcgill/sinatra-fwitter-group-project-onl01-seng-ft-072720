class TweetsController < ApplicationController

    get "/tweets" do
        if logged_in?
            erb :index
        else
            redirect "/login"
        end
    end

    get "/tweets/new" do
        if !logged_in?
            erb :"/tweets/new"
        else
            redirect "/login"
        end
    end

    post "/tweets" do
        if logged_in?
        @tweet = Tweet.new(params[:tweet])
        @tweet.user_id = current_user.id
        redirect "/tweets"
        else
        redirect "/"
        end
    end

end
