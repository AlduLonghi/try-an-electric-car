class AppointmentsController < ApplicationController
  before_action :authorized?

  def create
    appointment = Appointment.new(appointment_params)
    appointment.user_id = @current_user.id

    if appointment.save
      render json: appointment
    else
      render json: appointment.errors, status: 404
    end
  end

  private

  def appointment_params
    params.permit(:user_id, :car_id, :date)
  end
end
