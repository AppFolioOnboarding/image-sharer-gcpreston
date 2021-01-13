require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'valid link works' do
    img = Image.new(link: 'https://example.com')
    assert img.valid?
  end

  test 'invalid link does not work' do
    img = Image.new(link: 'some fake link')
    assert !img.valid?
  end
end
