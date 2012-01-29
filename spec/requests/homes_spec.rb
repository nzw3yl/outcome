require 'spec_helper'

describe "Home" do
  describe "GET /home" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end
  
  describe "user registration" do
    it "allows new users to register with a name, email address and password" do
      visit root_path

      fill_in "signup_name",                  :with => "testuser2"
      fill_in "signup_email",                 :with => "test2@example.com"
      fill_in "signup_password",              :with => "please"
      fill_in "signup_password_confirmation", :with => "please"

      click_button "Sign up"

      page.should have_content("Welcome! You have signed up successfully.")
    end
  end
  
  describe "user sign in" do
    it "allows users to sign in after they have registered" do
      user =  User.create(:name     => "tester",
                          :email    => "test2@example.com",
                          :password => "please")

      visit root_path

      fill_in "signin_email",    :with => "test2@example.com"
      fill_in "signin_password", :with => "please"

      click_button "Sign in"

      page.should have_content("Signed in successfully.")
    end
  end
end
