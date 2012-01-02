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

      @attr = {
       :name => "rule the world",
       :reason => "someone has to",
       :due_date => Time.now + 90.days,
       :target => 100,
       :public => false,
       :user_id => 2
     }
    end

    it "should redirect to the index page" 
      

  end

  describe "GET 'show'" do

    before(:each) do
       @attr = {
       :name => "rule the world",
       :reason => "someone has to",
       :due_date => Time.now + 90.days,
       :target => 100,
       :public => false
      }
      @user = Factory(:user)
      @attainment = @user.attainments.create!(@attr)
    end

    it "returns http success" do
      get 'show', :id => @attainment
      response.should redirect_to(attainments_path)
    end

  end

  describe "GET 'edit'" do

    before(:each) do
      @attainment = Factory(:attainment) 
    end

    it "returns http success" do
      get 'edit', :id => @attainment
      response.should redirect_to(attainments_path)
    end
  end

  
  describe "DELETE 'destroy'" do

    before(:each) do
      @attainment = Factory(:attainment) 
    end

    it "returns http success" 

  end

end
