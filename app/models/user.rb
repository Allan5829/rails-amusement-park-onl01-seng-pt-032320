require 'pry'
class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if self.happiness.present?
            if self.happiness > self.nausea
                return "happy"
            else
                return "sad"
            end 
        end 
    end 
end
