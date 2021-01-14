require 'test_helper'

class FiltersControllerTest < ActionDispatch::IntegrationTest
  test 'filters page' do
    Image.create(link: 'https://example.com', tag_list: 'tag1, tag2')
    Image.create(link: 'https://example.com/2', tag_list: 'tag2, tag3')

    get filter_path('tag1')
    assert_select 'img', 1

    get filter_path('tag2')
    assert_select 'img', 2

    get filter_path('tag3')
    assert_select 'img', 1

    get filter_path('tag4')
    assert_select 'h2', 'No images with tag tag4'
  end
end
