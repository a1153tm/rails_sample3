require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    assert_no_difference 'User.count' do
      get signup_path
      post users_path, params: {
        user: {
          name: "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar"
        }
      }
      assert_template 'users/new'
    end
  end

  test "Valid signup information" do
    assert_difference 'User.count' do
      get signup_path
      post users_path, params: {
        user: {
          name: "Example User",
          email: "user@example.com",
          password: "password",
          password_confirmation: "password"
        }
      }
      follow_redirect!
      assert_template 'users/show'
    end
  end

end
