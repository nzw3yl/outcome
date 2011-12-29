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
      :public => true
    }
  end

  it "should create a new instance given valid attibutes" do
    @user.attainments.create!(@attr)
  end

  describe "validations" do
    
    it "should require a user id" do
      Attainment.new(@attr).should_not be_valid
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

  
end


