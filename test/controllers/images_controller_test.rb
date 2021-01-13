require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get image upload page' do
    get new_image_url
    assert_response :success
    assert_select 'form', 1
  end

  test 'uploading image should redirect to image URL' do
    post images_url, params: { image: { link: 'https://example.com' } }
    assert_redirected_to image_url(Image.last.id)
    follow_redirect!
    assert_response :success
    assert_select 'img', 1
  end
end
