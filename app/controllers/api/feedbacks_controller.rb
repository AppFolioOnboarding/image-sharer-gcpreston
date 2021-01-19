module Api
  class FeedbacksController < ApplicationController
    def create
      @feedback = Feedback.new(params[:feedback].permit(:name, :comments))
      if @feedback.save
        render json: {}, status: :created
      else
        render json: { error: 'Something went wrong' }, status: :unprocessable_entity
      end
    end
  end
end
