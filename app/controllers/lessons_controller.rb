class LessonsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  def index
    @lessons = policy_scope(Lesson).order(created_at: :desc)
  end

  def show
    @lesson = Lesson.find(params[:id])
    authorize @lesson
    @user = current_user
    @appointment = Appointment.new(lesson: @lesson)
    @review = Review.new(lesson: @lesson)
    @reviews = Review.where(lesson: @lesson)
    @avg_review = avg_review
    @user_owns_lesson = (@lesson.user == current_user)
  end

  def update
    @lesson = Lesson.find(params[:id])
    authorize @lesson
    @lesson.update(lesson_params)
    redirect_to lesson_path(params[:id])
  end

  private

  def avg_review
    avg_review = 0
    @reviews.each do |review|
      avg_review += review.rating
    end
    avg_review /= @reviews.length
  end

  def lesson_params
    params.require(:lesson).permit(:description, :start_time, :end_time, :week_day, :location, :price, :max_attendees)
  end
end
