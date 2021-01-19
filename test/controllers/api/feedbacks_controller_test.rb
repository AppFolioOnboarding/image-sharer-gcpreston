require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test 'create feedbacks works' do
    assert_difference('Feedback.count', 1) do
      post api_feedbacks_path(feedback: { name: 'Test User', comments: 'Awesome product!!' })
    end

    assert_response :created
    assert_equal 'Test User', Feedback.last.name
    assert_equal 'Awesome product!!', Feedback.last.comments
  end

  test 'create feedback error' do
    assert_no_difference('Feedback.count') do
      post api_feedbacks_path(feedback: { comments: 'nameless feedback >:)' })
    end

    assert_response :unprocessable_entity
  end
end
