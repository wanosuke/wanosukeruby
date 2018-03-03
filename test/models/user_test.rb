require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user =  User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "initial name validation" do
    @user.name = "a"*51
    assert_not @user.valid?
  end

  test "email validation" do
  	@user.email = ""
  	assert_not @user.valid?
  end

  test "email downcase" do
  	dup_user = @user.dup
  	dup_user.email = @user.email.upcase
  	@user.save
  	assert_not dup_user.valid?
  end

  test "validate save" do
  	mix_add = "aAD@Abk.jP"
  	@user.email = mix_add
  	@user.save
  	assert_equal mix_add.downcase,@user.reload.email
  end

  test "around password" do
  	@user.password = @user.password_confirmation = "a"*5
  	assert_not @user.valid?
  end

end
