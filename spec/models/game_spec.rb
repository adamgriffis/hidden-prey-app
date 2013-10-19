require 'spec_helper'

describe Game do

	before(:each) do
		@attr = {
			:name => "myGame",
		}
	end

	it "should create a new instance given a valid attribute" do
		Game.create!(@attr)
	end

	it "should not allow empty name" do
		lambda { 
			Game.create!(@attr.merge(:name => ""))
		}.should raise_error(ActiveRecord::RecordInvalid,"Validation failed: Name can\'t be blank")
	end

	it "should reject duplicate name" do
		Game.create!(@attr)
		game_with_duplicate_name = Game.new(@attr)
		game_with_duplicate_name.should_not be_valid
	end

	it "should reject name identical up to case" do
		upcased_name = @attr[:name].upcase
		Game.create!(@attr.merge(:name => upcased_name))
		game_with_duplicate_name = Game.new(@attr)
		game_with_duplicate_name.should_not be_valid
	end

end
