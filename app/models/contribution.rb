class Contribution < ActiveRecord::Base
  attr_accessible :work_id, :attainment_id, :effort

  belongs_to :attainment
  belongs_to :work
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

