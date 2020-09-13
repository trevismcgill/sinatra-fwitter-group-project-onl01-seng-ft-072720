require 'pry'
class UsersController < ApplicationController

get "/signup" do
    if !logged_in?
    erb :"/users/signup"
    else
    redirect "/tweets"
  end
end
    
post "/signup" do
@user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect "/tweets"
    else
      redirect "/signup"
end   
end

get "/login" do
    if !logged_in?
    erb :"/users/login"
    else
    redirect "/tweets"
    end
end

post "/login" do
    # binding.pry
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/tweets"
    else
        redirect to "/signup"
    end
end

get "/logout" do
    if logged_in?
        session.clear
        redirect "/login"
    else
        redirect "/"
    end
end







end
