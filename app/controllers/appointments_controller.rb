class AppointmentsController < ApplicationController
  def create
    @appointment = Appointment.new(lesson_id: params[:lesson_id], user: current_user)
    authorize @appointment
    @appointment.save
    redirect_to lesson_path(params[:lesson_id])
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    @appointment.destroy
    redirect_to lessons_path
  end
end
