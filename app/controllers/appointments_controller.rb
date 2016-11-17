class AppointmentsController < ApplicationController
  def index
  end

  def new
    @doctors = Doctor.all.map { |d| [d.name, d.id] }
    @patients = Patient.all.map { |i| [i.name, i.id] }
    @appointments = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = 'Appointment Added'
      redirect_to :back
    else
      render :new
    end
  end

  def destroy
    appointment = Appointment.find(params[:id]) #need to know which doctor it belongs to in order to send to right place
    appointment.destroy
    flash[:success] = 'Appointment Cancelled'
    redirect_to doctor_path(appointment.doctor_id)
  end


  private
    def appointment_params
      params.require(:appointment).permit(:doctor_id, :patient_id, :date, :time)
    end


end
