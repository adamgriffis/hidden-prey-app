class Turn < ActiveRecord::Base
	has_one :game
	has_many :moves
end
