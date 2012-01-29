require 'spec_helper'

describe AttainmentsController do
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
      @user = Factory(:user)
       sign_in @user
      @attr = {
       :name => "rule the world",
       :reason => "someone has to",
       :due_date => Time.now + 90.days,
       :target => 100,
       :public => false,
       :user_id => 2
     }
    end
    
    it "should redirect to the index page" do
      post 'create', :attainment=> @attr
      response.should redirect_to(attainments_path)
    end
      
  end

  describe "GET 'show'" do
      before(:each) do
        @user = Factory(:user)
        sign_in @user
        @attainment = Factory(:attainment, :user_id => @user.id)
        @works = Factory(:work, :user_id => @user.id)
      end
      

    it "returns http success"   do
        get :show, :id => @attainment.id
        response.should be_success
      end

  end

  describe "GET 'edit'" do
    
    before(:each) do
      @user = Factory(:user)
      sign_in @user
      @attainment = Factory(:attainment, :user_id => @user.id)
    end
    

    it "should render the proper template" do
      get :edit, :id => @attainment.id
      response.should render_template("edit") 
    end 

  end

  
  describe "DELETE 'destroy'" do

    before(:each) do
      @user = Factory(:user)
      sign_in @user
      @attainment = Factory(:attainment) 
    end

    it "returns http success" do
      get 'destroy', :id => @attainment
      response.should redirect_to(attainments_path)
    end

  end

end
