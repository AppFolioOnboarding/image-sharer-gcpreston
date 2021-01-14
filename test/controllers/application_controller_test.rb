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

  test 'no tags displayed on empty state' do
    get root_path
    assert_select 'span', 0
  end

  test 'tags displayed next to images' do
    Image.create(link: 'https://example.com', tag_list: 'tag1, tag2')
    Image.create(link: 'https://example.com/2')

    get root_path
    assert_select 'span' do |elements|
      assert_equal 2, elements.length
      assert_equal 'No tags', elements[0].content
      assert_equal 'Tags: tag1, tag2', elements[1].content
    end
  end
end
