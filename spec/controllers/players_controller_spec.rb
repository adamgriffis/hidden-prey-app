require 'spec_helper'

describe PlayersController do

  before (:each) do
    @player = FactoryGirl.create(:player)
    sign_in @player
  end

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @player.id
      response.should be_success
    end
    
    it "should find the right player" do
      get :show, :id => @player.id
      assigns(:player).should == @player
    end
    
  end

end
