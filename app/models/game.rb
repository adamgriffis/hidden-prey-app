class Game < ActiveRecord::Base
	has_many :players

	validates :name, uniqueness: true, presence: true, :case_sensitive => false
end
