class ApplicationController < ActionController::Base
    
    helper_method:current_doctor,:logged_in?
    
    
    def current_doctor
      @current_doctor ||= Doctor.find(session[:doctor_id])  if session[:doctor_id]
    end
    def logged_in?
        !!current_doctor
    end
    
    def require_doctor
        if !logged_in?
            flash[:alert]="you need login to do this"
            redirect_to login_path
        end
    end
    

end
