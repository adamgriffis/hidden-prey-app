require "spec_helper"

describe TurnsController do
  describe "routing" do

    it "routes to #index" do
      get("/turns").should route_to("turns#index")
    end

    it "routes to #new" do
      get("/turns/new").should route_to("turns#new")
    end

    it "routes to #show" do
      get("/turns/1").should route_to("turns#show", :id => "1")
    end

    it "routes to #edit" do
      get("/turns/1/edit").should route_to("turns#edit", :id => "1")
    end

    it "routes to #create" do
      post("/turns").should route_to("turns#create")
    end

    it "routes to #update" do
      put("/turns/1").should route_to("turns#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/turns/1").should route_to("turns#destroy", :id => "1")
    end

  end
end
