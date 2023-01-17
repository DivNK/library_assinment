require 'bcrypt'
class BookController < ApplicationController
    skip_before_action :verify_authenticity_token
    def landing
    end
    def index
        curr_usr=User.find_by_id(session[:current_user_id])
        bk_lst=Book.all
        if(curr_usr.nil?)
            render json: "Not logged in"
        else
        render json: bk_lst
        end
        
     
    end
    
    def show
        v = Book.find(params[:id])
        render json: v
        # v = Property.where('city':params[:city])
        # puts params[:city]
        # puts v
        # render json: v
    end
    def create
        puts ("test")
        puts params[:bookAuthor]
        curr_usr=User.find_by_id(session[:current_user_id])
       
        if(curr_usr.nil?)
            render json: "Not logged in"
        else
        Book.create('bookName': params[:bookName],
            'bookAuthor': params[:bookAuthor], 
            'bookQuantity': params[:bookQuantity] )
    render json: "Data entered"
        end
    end
    
    def update
        p=Book.find(params[:id].to_i)
        curr_usr=User.find_by_id(session[:current_user_id])
        puts params[:bookName]
        if(curr_usr.nil?)
            render json: "Not logged in"
        else
        p.update('bookName': params[:bookName],
        'bookAuthor': params[:bookAuthor], 
        'bookQuantity': params[:bookQuantity] )
        render json: "data updated"
        end
    end
    def modify
        p=Book.find_by('bookName': params[:bookName])
        curr_usr=User.find_by_id(session[:current_user_id])
        puts params[:bookName]
        if(curr_usr.nil?)
            render json: "Not logged in"
        else
        p.update('bookName': params[:bookName],
        'bookAuthor': params[:bookAuthor], 
        'bookQuantity': params[:bookQuantity] )
        render json: "data updated"
        end
    end

    def destroy 
        p = Book.find(params[:id])
        curr_usr=User.find_by_id(session[:current_user_id])
        if(curr_usr.nil?)
            render json: "Not logged in"
        else
        p.destroy
        render json: "Data Deleted"
        end
    end

    def delete 
        p = Book.find_by('bookName': params[:bookName])
        curr_usr=User.find_by_id(session[:current_user_id])
        if(curr_usr.nil?)
            render json: "Not logged in"
        else
        p.destroy
        render json: "Data Deleted"
        end
    end

end
