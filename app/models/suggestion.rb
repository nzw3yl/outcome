class Suggestion < ActiveRecord::Base
  attr_accessible :name, :email, :target, :progress_metric_id, :user_id, :attainment_id

  belongs_to 	:attainment
  belongs_to	:progress_metric

  validates_presence_of 		:name
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

