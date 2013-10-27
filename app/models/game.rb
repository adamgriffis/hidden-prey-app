class Game < ActiveRecord::Base
	has_many :game_players
	has_many :players, :through => :game_players
	has_many :turns

	validates :name, :uniqueness => {:case_sensitive => false}, presence: true
end
