class DoctorsController < ApplicationController
  before_action :set_doctor, except: [:new, :create, :index]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: 'Doctor updated'
    else
      render :edit, error: @doctor.errors.full_messages
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_url, notice: 'Bye Bye, Doctor'
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name, :specialty, :insurance)
    end

end
