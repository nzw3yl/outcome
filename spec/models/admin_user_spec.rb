require 'spec_helper'

describe AdminUser do
  before(:each) do
  @attr = {
  :email                  => "test@example.com",
  :password		  => "please",
  :encrypted_password     => "please",
  :reset_password_token   => "token",
  :reset_password_sent_at => Time.now,
  :remember_created_at    => Time.now,
  :sign_in_count          => 1,
  :current_sign_in_at     => Time.now,
  :last_sign_in_at        => Time.now,
  :current_sign_in_ip     => "127.0.0.1",
  :last_sign_in_ip        => "127.0.0.1"
   }
  end
  it "should create a new instance given valid attributes" do
    AdminUser.create!(@attr)
  end
end
# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

