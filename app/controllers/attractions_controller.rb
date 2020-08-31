require 'pry'
class AttractionsController < ApplicationController


    def index
        @attractions = Attraction.all
        @user = current_user
        #binding.pry
    end 

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @user = current_user
    end 
    
    def new
        @attraction = Attraction.new
    end 

    def create
        @attraction = Attraction.new(attraction_params)

        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end 

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end 

    def update
        @attraction = Attraction.find_by(id: params[:id])
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end 

    def ride
        @ride = Ride.create(ride_params)
        session[:ride_success] = @ride.take_ride
        session[:ride_taken] = true
        redirect_to user_path(@ride.user)
    end 

    private

    def ride_params
        params.permit(:user_id, :attraction_id)
    end

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

end
