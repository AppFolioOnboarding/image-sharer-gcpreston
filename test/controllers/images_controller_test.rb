require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get image upload page' do
    get new_image_url
    assert_response :success
    assert_select 'form', 1
  end

  test 'uploading valid URL should work and redirect' do
    assert_difference('Image.count', 1) do
      post images_url, params: { image: { link: 'https://www.example.com' } }
    end
    assert_redirected_to image_url(Image.last.id)
  end

  test "don't upload invalid URL" do
    assert_no_difference 'Image.count' do
      post images_url, params: { image: { link: 'bad link' } }
    end
    assert_response :unprocessable_entity
  end
end
