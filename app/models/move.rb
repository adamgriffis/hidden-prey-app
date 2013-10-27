class Move < ActiveRecord::Base
	has_one :player
	has_one :turn
end
