require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "can see the landing page" do
    get "/"
    assert_select "h2", "More Inquiries, More Sales"
  end

  # test "can see the user public listing page" do
  #   get my_listing_path(id: 7)
  #   # assert_response :success
  # end

  # test "can see the user public listing show listing" do
  #   get show_listing_path(id: 7, prop_id: 33)
  #   assert_response :success
  # end

  test "user sign in" do
    get sessions_new_login_path()
    assert_select "h1", {:text => "Login to you account"}
    assert_response :success
    post sessions_create_login_path(), params:{ 
      email: users(:three).email,
      password: users(:three).password_digest
    }
    follow_redirect!
    get my_listing_path(id: 7)
    assert_select "a", {:text => "Listings"}
    assert_response :success
  end

end
