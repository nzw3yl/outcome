RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end

module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = Factory.create(:user)
      sign_in user
    end
  end
end
