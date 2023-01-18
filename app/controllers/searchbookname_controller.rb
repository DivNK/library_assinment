class SearchbooknameController < ApplicationController
    def index
        
        a = params[:bookName]== nil
       if(a)
        render json: "Enter Book Name"
       end
       curr_usr=User.find_by_id(session[:current_user_id])
       if(curr_usr.nil?)
           render json: "Not logged in"
       else
        bk = Book.find_by('bookName': params[:bookName])
        # bk=Book.where(["bookName = ?", params[:bookName]])
        # bk=Book.where("books.bookName LIKE ?", "#{params[:bookName]}%")
        # bk=Book.where("bookName LIKE '%#{params[:bookName]}%'")
        # bk=Book.where("bookName LIKE ?", "%" + params[:bookName] + "%")
        # bk=Book.where(bookName: "%"+params[:bookName]+"%")
        puts "************************************"
        puts !bk.nil?
        if(!bk.nil?)
            render json: bk
    end
end
end
end
