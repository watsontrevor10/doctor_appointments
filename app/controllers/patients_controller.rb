class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit, :update, :show, :destroy]
  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new 
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path
    else
      render :new 
    end
  end

  def show
  end

  def edit
    
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy 
    redirect_to patients_path
  end

  private
 
  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name)
  end
end
