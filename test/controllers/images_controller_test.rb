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

  test 'empty tags displayed on show page' do
    Image.create(link: 'https://www.example.com/2')
    get image_url(Image.last.id)

    assert_response :success
    assert_select 'h2', 'Tags'
    assert_select 'p', 'None'
  end

  test 'tags displayed on show page' do
    Image.create(link: 'https://www.example.com', tag_list: 'tag1, tag2')
    get image_url(Image.last.id)

    assert_response :success
    assert_select 'h2', 'Tags'
    assert_select 'li' do |elements|
      assert_equal 'tag1', elements[0].content
      assert_equal 'tag2', elements[1].content
    end
  end

  test 'delete image' do
    Image.create(link: 'https://www.example.com')
    assert_difference 'Image.count', -1 do
      delete image_url(Image.last.id)
    end
    assert_redirected_to root_path
  end

  test 'delete non-existent image' do
    assert_no_difference 'Image.count' do
      delete image_url(1)
    end
    assert_redirected_to root_path
  end
end
