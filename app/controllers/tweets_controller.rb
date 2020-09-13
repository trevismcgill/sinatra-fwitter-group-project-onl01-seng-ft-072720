class TweetsController < ApplicationController

    get "/tweets" do
        if logged_in?
            erb :index
        else
            redirect "/login"
        end
    end

end
