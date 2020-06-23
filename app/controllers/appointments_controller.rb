class AppointmentsController < ApplicationController
  def create
    # raise
    Appointment.create(lesson_id: params[:lesson_id], user_id: current_user.id)
  end
end
