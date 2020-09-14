class TweetsController < ApplicationController

    get "/tweets" do
        # binding.pry
        if logged_in?
            erb :index
            # @tweets = Tweet.all
            # erb :"/tweet/tweets"
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
        current_user.tweets << @tweet
        current_user.save
        redirect "/tweets"
        else
        redirect "/"
        end
    end

    get "/tweets/:id" do
        if logged_in?

        end
    end

end
