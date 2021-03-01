class AppointmentsController < ApplicationController
  before_action :authorize

  def index
    @appointments = Appointment.where(user_id: @current_user.id)
    if @appointments
      render :index
    else
      render json: 'No appointments yet'
    end
  end

  def create
    appointment = Appointment.new(appointment_params)
    appointment.user_id = @current_user.id

    if appointment.save
      render json: appointment, status: :created
    else
      render json: { errors: appointment.errors.full_messages }, status: 500
    end
  end

  def destroy
    appointment = Appointment.find_by(id: params[:id])
    appointment.destroy
    render json: 'Succesfully deleted', status: :ok
  end

  private

  def appointment_params
    params.require(:appointment).permit(:user_id, :car_id, :date, :city)
  end
end
