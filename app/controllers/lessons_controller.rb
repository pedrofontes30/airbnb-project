class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    @user = User.find(1)
    @appointment = Appointment.new
    @review = Review.new
  end
end
