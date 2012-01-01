# == Schema Information
#
# Table name: attainments
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  reason      :text
#  due_date    :datetime
#  progress_id :integer
#  target      :integer
#  user_id     :integer
#  code        :string(255)
#  public      :boolean
#  created_at  :datetime
#  updated_at  :datetime
#
require 'spec_helper'

describe Attainment do
  before (:each) do
    @user = Factory(:user)
    @attr = {
      :name => "rule the world",
      :reason => "somebody has to and it would be really fun",
      :due_date => Time.now + 90.days,
      :target => 100,
      :code => "RTW",
      :public => true,
      :user_id => 2
    }
  end

  it "should create a new instance given valid attibutes" do
    @user.attainments.create!(@attr)
  end

  describe "validations" do
    
    it "should require a user id" do
      @user.attainments.build(:user_id => "").should_not be_valid
    end

    it "should require nonblank name" do
      @user.attainments.build(:name => " ").should_not be_valid
    end

    it "should require nonblank reason" do
      @user.attainments.build(:reason => " ").should_not be_valid
    end

    it "should require a due date in the future" do
      @user.attainments.build(:due_date => Time.now - 1.day).should_not be_valid
    end

    it "should require a target" do
      @user.attainments.build(:target => nil).should_not be_valid
    end

    it "should require a public/private value that is not nil" do
      @user.attainments.build(:public => nil).should_not be_valid
    end
  end

  describe "user associations" do

    before(:each) do
      @attainment = @user.attainments.create(@attr)
    end

    it "should have a user attribute" do
      @attainment.should respond_to(:user)
    end

    it "should have the right associated user" do
      @attainment.user_id.should == @user.id
      @attainment.user.should == @user
    end
  end
 
  describe "progress metric associations" do

    before(:each) do
      @attainment = @user.attainments.create(@attr)
    end

    it "should have a progress_metric attribute" do
      @attainment.should respond_to(:progress_metric)
    end

  end

  describe "has many associations" do
   
    before(:each) do
      @attainment = @user.attainments.create(@attr)
    end

    it "should have a suggestions method" do
      @attainment.should respond_to(:suggestions)
    end

    it "should have a contributions method" do
      @attainment.should respond_to(:contributions)
    end

    it "should have a works method" do
      @attainment.should respond_to(:works)
    end

  end


  
end


# == Schema Information
#
# Table name: attainments
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  reason             :text
#  due_date           :datetime
#  progress_metric_id :integer
#  target             :integer
#  user_id            :integer
#  code               :string(255)
#  public             :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  current            :integer
#

