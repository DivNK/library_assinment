class LoginController < ApplicationController
skip_before_action :verify_authenticity_token

def create
    usr = User.find_by('userEmail': params[:userEmail])

    if(usr.nil?)
        render json: "User Not Found"
    else
        if(usr.authenticate(params[:password]))
            session[:current_user_id]=usr.id
            render json: "Login Successfull"
        else
            render json: "Invalid Password"
        end
    end            
end
end
