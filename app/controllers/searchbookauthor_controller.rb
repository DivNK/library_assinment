class SearchbookauthorController < ApplicationController
    def index
        
        a = params[:bookAuthor]== nil
       if(a)
        render json: "Enter Author"
       end
       curr_usr=User.find_by_id(session[:current_user_id])
       if(curr_usr.nil?)
           render json: "Not logged in"
       else
        bk = Book.where(:bookAuthor => params[:bookAuthor])
        puts "************************************"
        puts !bk.nil?
        if(!bk.nil?)
            render json: bk
    end
end
end
end
