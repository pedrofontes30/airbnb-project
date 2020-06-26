class AppointmentsController < ApplicationController
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @appointment = Appointment.new(lesson_id: params[:lesson_id], user: current_user)
    authorize @appointment
    if @appointment.save
      redirect_to lesson_path(@lesson, anchor: "icon")
    else
      render "lessons/show"
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @appointment = Appointment.find(params[:format])
    authorize @appointment
    if @appointment.destroy
      redirect_to lesson_path(@lesson, anchor: "icon")
    else
      render "lessons/show"
    end
  end
end
