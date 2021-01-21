require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  test 'valid feedback' do
    f = Feedback.new(name: 'Graham', comments: 'Looks great!')
    assert_predicate f, :valid?
  end

  test 'invalid missing name' do
    f = Feedback.new(comments: 'Looks great!')
    refute_predicate f, :valid?
  end

  test 'invalid missing comments' do
    f = Feedback.new(name: 'Graham')
    refute_predicate f, :valid?
  end
end
