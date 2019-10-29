require 'test_helper'
class ApplicationIntegrationTest < ActionDispatch::IntegrationTest
  def test_home
    get '/'
    assert_response :success
    assert_select 'h1', /Welcome .* Sharer/
  end
end
