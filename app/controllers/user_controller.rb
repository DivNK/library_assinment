require 'bcrypt'
class UserController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
   
        curr_usr=User.find_by_id(session[:current_user_id])
        if(curr_usr.nil?)
            render json: "Not logged in"
        else
        render json: curr_usr
        end
        # render json: User.all
end


    def create

            puts "*****************************************"
            # puts params
            # request.path_parameters[:format] == 'json'

          p=User.create('userName': params[:userName],
            'userEmail': params[:userEmail],
            'password': params[:password]
             )
        #   puts p
          render json: "Data Added"
  
    end
    def show
        v = User.all
        render json: v

    end
    def update
    p=User.find_by('userEmail': params[:userEmail])
    p.update( 'password': params[:password] )
    render json: "Password Updated"
    end


end
