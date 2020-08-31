require 'pry'
class SessionsController < ApplicationController

    def new
    end 

    def create
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
        if user
            @user = user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/signin'
        end
    end 
end