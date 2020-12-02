class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :require_doctor, except: [:show, :index]
  before_action :require_same_doctor, only: [:edit, :update,:destroy]
  

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.paginate(page: params[:page], per_page: 5)
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.doctor=current_doctor
      if @patient.save
        flash[:notice] = "New patient was created."
        redirect_to @patient
      else
         render :new 
      end
    end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
      if @patient.update(patient_params)
        flash[:notice] = "Changed successfully." 
        redirect_to @patient
      else
        render 'edit'
      end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end
   
   def patient_params
      params.require(:patient).permit(:firstName, :lastName, :description)
  end 
  
  def require_same_doctor
        if current_doctor!=@patient.doctor
          flash[:alert] ="You are not allow to do this"
          redirect_to @patient
        end
    end
end
