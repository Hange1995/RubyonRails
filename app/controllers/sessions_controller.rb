class SessionsController< ApplicationController
    
    def new
        
    end    
    def create
        doctor= Doctor.find_by(email: params[:session][:email].downcase)
        if doctor && doctor.authenticate(params[:session][:password])
            session[:doctor_id]=doctor.id
            flash[:notice] = "welcome logged in"
            redirect_to doctor
        else
            flash.now[:alert] = "Something wrong"
            render 'new'
        end 
    end    
    def destroy
        session[:doctor_id]=nil
        flash[:notice] = "logged out"
        redirect_to root_path
    
    end    
end
