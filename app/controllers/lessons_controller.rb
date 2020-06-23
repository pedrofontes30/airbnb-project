class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    authorize @lesson
    @user = current_user
    @appointment = Appointment.new
    @review = Review.new
    @reviews = Review.where(lesson_id: @lesson.id)
    @avg_review = avg_review
  end

  private

  def avg_review
    avg_review = 0
    @reviews.each do |review|
      avg_review += review.rating
    end
    avg_review /= @reviews.length
  end
end
