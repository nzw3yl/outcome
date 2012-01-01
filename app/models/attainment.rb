
class Attainment < ActiveRecord::Base
  attr_accessible :name, :reason, :due_date, :target, :code, :public, :progress_metric_id, :attainment_ids

  validates 		:name, :presence => true
  validates 		:reason, :presence => true
  #validates_datetime 	:due_date, :after => lambda {Date.current}
  validates		:target, :presence => true
  validates_inclusion_of :public, :in => [true, false]
  validates		:user_id, :presence => true

  belongs_to :user
  belongs_to :progress_metric
  has_many   :contributions
  has_many   :works, :through => :contributions
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

