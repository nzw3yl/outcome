require 'spec_helper'

describe Contribution do
  before(:each) do
   @attr = {
     :work_id => 2,
     :attainment_id => 4,
     :effort => 100
   }
  end

  it "should create a new instance given valid attributes" do
    Contribution.create!(@attr)
  end
end
# == Schema Information
#
# Table name: contributions
#
#  id            :integer         not null, primary key
#  work_id       :integer
#  attainment_id :integer
#  effort        :integer
#  created_at    :datetime
#  updated_at    :datetime
#

