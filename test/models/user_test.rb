require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(name: "Foo Bar", email: "example@foobar.com", password: "password", 
  		password_confirmation: "password")
  end

  test "should be valid" do
  	assert @user.valid?
  end
end
