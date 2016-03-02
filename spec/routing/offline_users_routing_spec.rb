require "spec_helper"

describe OfflineUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/offline_users").should route_to("offline_users#index")
    end

    it "routes to #new" do
      get("/offline_users/new").should route_to("offline_users#new")
    end

    it "routes to #show" do
      get("/offline_users/1").should route_to("offline_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/offline_users/1/edit").should route_to("offline_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/offline_users").should route_to("offline_users#create")
    end

    it "routes to #update" do
      put("/offline_users/1").should route_to("offline_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/offline_users/1").should route_to("offline_users#destroy", :id => "1")
    end

  end
end
