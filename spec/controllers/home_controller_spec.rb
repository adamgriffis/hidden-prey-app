require 'spec_helper'

describe HomeController do

  before (:each) do
    @player = FactoryGirl.create(:player)
    sign_in @player
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
