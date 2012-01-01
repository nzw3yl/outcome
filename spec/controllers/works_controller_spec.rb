require 'spec_helper'

describe WorksController do
  render_views
  login_user

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do

    before(:each) do
        @attr = {
       :description => "invade france",
       :effort => 100,
       :progress_id_metric => 1,
       :user_id => 2
     }
    end

    it "returns http success" do
      post 'create', :work => @attr
      response.should redirect_to(attainments_path)
    end
  end

  describe "GET 'show'" do
 
    before(:each) do
       
       @work = Factory(:work)
    end

    it "returns http success" do
      get 'show', :id => @work
      response.should be_success
    end
  end

  describe "GET 'destroy'" do

    before(:each) do
        @work = Factory(:work)
    end

    it "returns http success" do
      get 'destroy', :id => @work
      response.should be_success
    end
  end

end
