require 'pry'
class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        @attraction = self.attraction
        user = self.user 
        if attraction.min_height > user.height && attraction.tickets > user.tickets
            "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif attraction.min_height > user.height
            "Sorry. You are not tall enough to ride the #{@attraction.name}."
        elsif attraction.tickets > user.tickets
            "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
        else
            user.tickets = user.tickets - attraction.tickets
            user.nausea = user.nausea + attraction.nausea_rating
            user.happiness = user.happiness + attraction.happiness_rating
            user.save
            #binding.pry
            "Thanks for riding the #{@attraction.name}!"
        end 
    end 
end
