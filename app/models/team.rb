class Team < ApplicationRecord
    has_many :players
    has_many :games 

    validates :name, :sport, :num_of_players, presence: true 
end
