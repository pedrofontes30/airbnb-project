class LessonsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    @user = User.find(1)
    @appointment = Appointment.new
    @review = Review.new

  end
end
