Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "book#landing"
  resources :book
  resources :user
  get "BookList" , to:"book#index"
  get "Register" , to:"user#create"
  get "Login" , to:"login#create"
  get "Updatepassword" , to:"user#update"
  get "UserList" , to:"user#show"
  get "AddBook" , to:"book#create"
  get "UpdateBook" , to:"book#modify"
  get "DeleteBook" , to:"book#delete"
  get "Logout" , to:"logout#index"
  get "SearchName" , to:"searchbookname#index"
  get "SearchAuthor" , to:"searchbookauthor#index"

end
