class Suggestion < ActiveRecord::Base
  attr_accessible :name, :email, :target, :progress_metric_id, :user_id, :attainment_id

  belongs_to 	:attainment
  belongs_to	:progress_metric

  validates_presence_of 	:name

end
