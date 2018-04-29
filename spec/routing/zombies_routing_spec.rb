require "rails_helper"

RSpec.describe Api::V1::ZombiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "api/v1/zombies").to route_to("api/v1/zombies#index", :format => :json)
    end

    it "routes to #show" do
      expect(:get => "api/v1/zombies/1").to route_to("api/v1/zombies#show", :id => "1", :format => :json)
    end

    it "routes to #create" do
      expect(:post => "api/v1/zombies").to route_to("api/v1/zombies#create", :format => :json)
    end

    it "routes to #update via PUT" do
      expect(:put => "api/v1/zombies/1").to route_to("api/v1/zombies#update", :id => "1", :format => :json)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "api/v1/zombies/1").to route_to("api/v1/zombies#update", :id => "1", :format => :json)
    end

    it "routes to #destroy" do
      expect(:delete => "api/v1/zombies/1").to route_to("api/v1/zombies#destroy", :id => "1", :format => :json)
    end

    it "routes to #add_weapon" do
      expect(:post => "api/v1/zombies/1/add_weapon").to route_to("api/v1/zombies#add_weapon", :id => "1", :format => :json)
    end

    it "routes to #add_armor" do
      expect(:post => "api/v1/zombies/1/add_armor").to route_to("api/v1/zombies#add_armor", :id => "1", :format => :json)
    end

    it "routes to #remove_weapon" do
      expect(:post => "api/v1/zombies/1/remove_weapon").to route_to("api/v1/zombies#remove_weapon", :id => "1", :format => :json)
    end

    it "routes to #remove_armor" do
      expect(:post => "api/v1/zombies/1/remove_armor").to route_to("api/v1/zombies#remove_armor", :id => "1", :format => :json)
    end
  end
end
