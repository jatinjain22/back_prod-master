require "spec_helper"

describe RecurringsController do
  describe "routing" do

    it "routes to #index" do
      get("/recurrings").should route_to("recurrings#index")
    end

    it "routes to #new" do
      get("/recurrings/new").should route_to("recurrings#new")
    end

    it "routes to #show" do
      get("/recurrings/1").should route_to("recurrings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/recurrings/1/edit").should route_to("recurrings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/recurrings").should route_to("recurrings#create")
    end

    it "routes to #update" do
      put("/recurrings/1").should route_to("recurrings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/recurrings/1").should route_to("recurrings#destroy", :id => "1")
    end

  end
end
