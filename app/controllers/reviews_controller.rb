class ReviewsController < ApplicationController
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @review = Review.new(content: params[:review][:content],
                         rating: params[:review][:rating],
                         lesson_id: params[:lesson_id],
                         user_id: current_user.id)
    authorize @review
    if @review.save
       redirect_to lesson_path(@lesson, anchor: "review-#{@review.id}")
     else
      render "lessons/show"
    end
  end
end
