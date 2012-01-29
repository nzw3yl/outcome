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
  

  describe "GET 'create'" do
    
    before(:each) do
      
       @user = Factory(:user)
       @attainment = Factory(:attainment)
        @attr = {
       :name => "invade france",
       :target => 100,
       :user_id => @user,
       :attainment_id => @attainment,
       :email => "test@example.com"
     }
    end

    it "redirects to New Suggestion if current user own the suggestion" do
      @signed_in_user = User.find(@attainment.user_id)
      sign_in @signed_in_user
      post 'create', :suggestion => @attr
      response.should redirect_to("/suggestions/new?id=#{assigns(:suggestion).attainment_id}")
    end
    
    it "redirects to Index Attainments if current user does not own the suggestion" do
      @signed_in_user = User.first #Factory(:attainment).id = 2
      sign_in @signed_in_user
      post 'create', :suggestion => @attr
      response.should redirect_to(attainments_path)
    end
   
  end

  
end
