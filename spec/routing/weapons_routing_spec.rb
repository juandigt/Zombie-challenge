require "rails_helper"

RSpec.describe Api::V1::WeaponsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "api/v1/weapons").to route_to("api/v1/weapons#index", :format => :json)
    end

    it "routes to #create" do
      expect(:post => "api/v1/weapons").to route_to("api/v1/weapons#create", :format => :json)
    end

    it "routes to #update via PUT" do
      expect(:put => "api/v1/weapons/1").to route_to("api/v1/weapons#update", :id => "1", :format => :json)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "api/v1/weapons/1").to route_to("api/v1/weapons#update", :id => "1", :format => :json)
    end

    it "routes to #destroy" do
      expect(:delete => "api/v1/weapons/1").to route_to("api/v1/weapons#destroy", :id => "1", :format => :json)
    end
  end
end
