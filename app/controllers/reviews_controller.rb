class ReviewsController < ApplicationController
  def create
    @review = Review.new(content: params[:review][:content],
                         rating: params[:review][:rating],
                         lesson_id: params[:lesson_id],
                         user_id: current_user.id)
    authorize @review
    @review.save
    redirect_to lesson_path(params[:lesson_id])
  end
end
