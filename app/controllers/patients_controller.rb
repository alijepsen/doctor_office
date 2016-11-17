class PatientsController < ApplicationController
  before_action :set_patient, except: [:new, :create, :index]

  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: 'Patient added!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Patient successfully modified'
    else
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: 'Patient successfully removed from system'
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :telephone)
  end


end
