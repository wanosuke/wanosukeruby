require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid information user" do 
  	get signup_path
  	assert_template 'users/new'
  	assert_no_difference 'User.count'do
  		post users_path, params: { user: { name: "hidehumi",
  											email: "invalid.jp",
 											password: "test",
 											password_confirmation: ""
  										}}
  	end
  	assert_template 'users/new'	
   end

 test "valid information user" do 
  	get signup_path
  	assert_template 'users/new'
  	assert_difference 'User.count',1 do
  		post users_path, params: { user: { name: "hidehumi",
  											email: "valid@exmaple.com",
 											password: "testtest",
 											password_confirmation: "testtest"
  										}}
  	end
  	follow_redirect!
  	assert_template 'users/show'
  end



end
