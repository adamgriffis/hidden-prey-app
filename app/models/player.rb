class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :username, uniqueness: true, presence: true, :case_sensitive => false

  has_many :game_players
  has_many :games, :through => :game_players
end
