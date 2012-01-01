require 'spec_helper'

describe ProgressMetric do
  before(:each) do
   @attr = {
     :name => "pushups",
     :direction => false,
     :code => "pu",
     :symbol => "pu",
     :lang_code => "en",
     :display => "did # pushups today"
   }
  end

  it "should create a new instance given valid attributes" do
    ProgressMetric.create!(@attr)
  end
end
# == Schema Information
#
# Table name: progress_metrics
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  direction  :boolean
#  code       :string(255)
#  symbol     :string(255)
#  lang_code  :string(255)
#  created_at :datetime
#  updated_at :datetime
#  display    :string(255)
#

