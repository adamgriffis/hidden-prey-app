class Game < ActiveRecord::Base
	has_many :game_players
	has_many :players, :through => :game_players

	validates :name, uniqueness: true, presence: true, :case_sensitive => false
end
