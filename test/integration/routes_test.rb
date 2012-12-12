require 'test_helper'

class RoutesTest < ActionController::IntegrationTest
  test "notifications route" do
    assert_generates "/purchases/notification",
                     { controller: "my_moip_rails/purchases", action: "notification" }
  end
end
