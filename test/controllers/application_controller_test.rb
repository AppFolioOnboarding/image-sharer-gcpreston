require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get root_path
    assert_response 200
    assert_select 'h1', 'Welcome to Ropes!'
  end

  test 'image index descending order' do
    img1 = Image.create(link: 'https://example.com')
    img2 = Image.create(link: 'https://example.com/thing')

    get root_path
    assert_select 'img' do |images|
      assert_equal images.length, Image.count
      assert_equal images[0]['src'], img2.link
      assert_equal images[1]['src'], img1.link
    end
  end
end
