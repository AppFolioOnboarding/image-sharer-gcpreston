require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get image upload page' do
    get new_image_url
    assert_response :success
    assert_select 'form', 1
  end
end
