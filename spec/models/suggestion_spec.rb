require 'spec_helper'

describe Suggestion do
  before(:each) do
   @attainment = Factory(:attainment)
   @attr = {
      :name => "do this",
      :target => 100,
      :progress_metric_id => 2,
      :email => "test@example.com",
      :user_id => 2
    }
   @suggestion = @attainment.suggestions.build(@attr)
  end

  it "should create a new instance given valid attributes" do
     @suggestion.save!
  end

  it "should require a name" do
    no_name_suggestion = @attainment.suggestions.new(@attr.merge(:name => ""))
    no_name_suggestion.should_not be_valid
  end

  describe "attainment methods" do
    
    it "should have an attainment attribute" do
       @suggestion.should respond_to(:attainment)
    end
  end
end
# == Schema Information
#
# Table name: suggestions
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  attainment_id      :integer
#  target             :integer
#  progress_metric_id :integer
#  user_id            :integer
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

