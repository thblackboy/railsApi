require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get urls_create_url
    assert_response :success
  end

  test "should get redirect" do
    get urls_redirect_url
    assert_response :success
  end

  test "should get stats" do
    get urls_stats_url
    assert_response :success
  end
end
