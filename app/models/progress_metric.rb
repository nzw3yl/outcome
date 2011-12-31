class ProgressMetric < ActiveRecord::Base
  attr_accessible :name, :direction, :code, :symbol, :lang_code

  has_many :attainments
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
#

