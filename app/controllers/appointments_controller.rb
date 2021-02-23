class AppointmentsController < ApplicationController
  before_action :authorize, only: [:index, :create]

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
    p appointment.date

    if appointment.save
      render json: appointment, status: :created
    else
      render json: appointment.errors, status: :unprocessable_entity
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
