require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get root_path
    assert_response 200
    assert_select 'h1', 'Welcome to Ropes!'
  end
end
