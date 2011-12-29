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
class Attainment < ActiveRecord::Base
  attr_accessible :name, :reason, :due_date, :target, :code, :public

  validates 		:name, :presence => true
  validates 		:reason, :presence => true
  validates_datetime 	:due_date, :after => Time.now
  validates		:target, :presence => true
  validates		:public, :presence => true
  validates		:user_id, :presence => true

  belongs_to :user
end


