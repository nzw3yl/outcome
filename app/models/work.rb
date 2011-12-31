class Work < ActiveRecord::Base
  attr_accessible :description, :progress_metric_id, :effort, :user_id, :attainment_ids

  belongs_to :user
  belongs_to :progress_metric
  has_many   :contributions
  has_many   :attainments, :through => :contributions
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

