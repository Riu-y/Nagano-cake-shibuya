require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get order_items" do
    get admins_order_items_url
    assert_response :success
  end

end
