require 'spec_helper'

describe SuggestionsController do

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
      response.should redirect_to(attainments_path)
    end
  end

  describe "GET 'create'" do
    it "returns http success" 
   
  end

  describe "GET 'show'" do
    before(:each) do 
       @suggestion = Factory(:suggestion)
    end
    it "returns http success" do
      get 'show', :id => @suggestion
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    before(:each) do 
       @suggestion = Factory(:suggestion)
    end
    it "returns http success" do
      get 'destroy', :id => @suggestion
      response.should be_success
    end
  end

end
