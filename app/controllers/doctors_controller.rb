class DoctorsController < ApplicationController
    before_action :require_doctor, only:[:edit,:update]
    before_action :require_same_doctor, only:[:edit, :update,:destroy]
    
    

    def show
         @doctor=Doctor.find(params[:id])
         @patients = @doctor.patients.paginate(page: params[:page], per_page: 5)
    end
     def new
          @doctor=Doctor.new
     end
     def index
          @doctors=Doctor.paginate(page: params[:page], per_page: 5)
          
     end
     
     def edit
          @doctor=Doctor.find(params[:id])
     end
     def update
          @doctor=Doctor.find(params[:id])
          if @doctor.update(doctor_params)
             flash[:notice] = "Successfully Updated!"        
             redirect_to @doctor
          else
               render 'edit'
          end

     end 
     
     def create
          @doctor = Doctor.new(doctor_params)

           if @doctor.save
             session[:doctor_id]=@doctor.id
             flash[:notice] = "Successfully signup!"
             redirect_to @doctor
           else
              render 'new' 
           end
     end 


     
     
     private
     
     def doctor_params
          params.require(:doctor).permit(:firstName,:lastName,:email,:password)
     end
     
     def require_same_doctor
        if current_doctor!=@doctor
          flash[:alert] ="You are not allow to do this"
          redirect_to @doctor
        end
    end
end