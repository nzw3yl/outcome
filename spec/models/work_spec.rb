require 'spec_helper'

describe Work do
   before(:each) do
   @attr = {
     :user_id => 2,
     :progress_metric_id => 4,
     :effort => 100,
     :name => "climbing mountains"
   }
   end

  it "should create a new instance given valid attributes" do
    Work.create!(@attr)
  end
end
# == Schema Information
#
# Table name: works
#
#  id                 :integer         not null, primary key
#  description        :string(255)
#  progress_metric_id :integer
#  effort             :integer
#  user_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#

