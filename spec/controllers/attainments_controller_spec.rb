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
       :public => false
     }
    end

    it "should redirect to the index page" do
      post 'create', :attainment => @attr
      response.should redirect_to(attainments_path)
    end

  end

  describe "GET 'show'" do

    before(:each) do
       @attainment = Factory(:attainment) 
    end

    it "returns http success" do
      get 'show', :id => @attainment
      response.should be_success
    end

  end

  describe "GET 'edit'" do

    before(:each) do
      @attainment = Factory(:attainment) 
    end

    it "returns http success" do
      get 'edit', :id => @attainment
      response.should be_success
    end
 
  end

  describe "PUT 'update'" do

    before(:each) do
      @attainment = Factory(:attainment) 
      @attr = {
       :name => "rule the world2",
       :reason => "someone has to. why not me",
       :due_date => Time.now + 90.days,
       :target => 100,
       :public => true
     }
    end
    it "returns http success" do
      put 'update', :id => @attainment
      response.should redirect_to(attainment_path)
    end

  end

  describe "DELETE 'destroy'" do

    before(:each) do
      @attainment = Factory(:attainment) 
    end

    it "returns http success" do
      delete 'destroy', :id => @attainment
      response.should redirect_to(attainments_path)
    end

  end

end
