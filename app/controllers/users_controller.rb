require 'pry'
class UsersController < ApplicationController
    before_action :logged_in?, only: [:show]

    def home
    end 

    def show
        @user = User.find_by(id: params[:id])
        if session[:ride_taken]
            session[:ride_taken] = false
            @ride_success = session[:ride_success]
        end 
    end 

    def new
    end 

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end   
    end 

    def destroy
        session.clear
        redirect_to '/'
    end 

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

    def logged_in?
        if !session[:user_id]
            redirect_to '/'
        end
    end 

end
