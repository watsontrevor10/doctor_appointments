class AppointmentsController < ApplicationController
  before_action :set_patient
  before_action :set_appointment, only: [:edit, :update, :destroy]

  def index
    @appointments = @patient.appointments.where(purpose: "a back thing")
  end

  def new
    @appointment = @patient.appointments.new
    @user = User.all 
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_appointments_path(@patient)
    else
      render :new
    end
  end

  def show
  end

  def edit
    
  end

  def update
    
    if @appointment.update(appointment_params)
      redirect_to patient_appointments_path(@patient_id)
    else
      render :edit
    end
  end

  def destroy
    
    @appointment.destroy
    redirect_to patient_appointments_path(@patient)
  end
  private 

  def set_appointment
    @appointment = @patient.appointments.find(params[:id])
  end

  def set_doctor
    @doctor = User.find(params[:user_id])
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
  def appointment_params
    params.require(:appointment).permit(:purpose, :user_id, :date)
  end
end
