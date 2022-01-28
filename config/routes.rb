Rails.application.routes.draw do
 
  mount ActionCable.server => '/cable'


  # root 'rooms#show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  resources :posts
 
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: 'auth', path_names: { sign_in: "login" ,sign_up: "cmon_let_me_in", sign_out: "logout" ,password: "secret", confirmation: "verification" }
  
  #devise_scope :user do
    #get 'sign_in', to: 'devise/sessions#new'
  #end

  root "r1#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  


  

  #resources :tickets do
   # collection do
    #  get :new
    #end  
  #end  
  #end



  #resources :tickets

  get "/ticket/public", to:"tickets#public"
  get "/ticket/private", to:"tickets#private"
  get "/ticket/archive", to:"tickets#archive"
  get "/tickets/:id", to:"tickets#show", as: 'ticket'
  get "/tickets/:id/edit", to:"tickets#edit" , as: 'ticket_edit'
  put "/tickets/:id", to:"tickets#update" ,as: 'ticket_update'   
  delete "/tickets/:id", to:"tickets#destroy" , as: 'ticket_delete'  
  get "/ticket/new" , to:"tickets#new" 
  post "/ticket", to:"tickets#create" 
  
  resources :tickets, only: [:index]  do
    collection do
      get :archive
    end    
  end

  resources :categories
  resources :blogs
  
  resources :products
  resources :employees
  resources :pictures

  resources :examples

  get "/search", to:"tickets#search"
  #resources :search do
   # get :search, on: :collection
  #end  

  #get "/blog", to:"blogs#index"
  

  #resources :cates
   #get "/cates", to: "cates#index" 
  


  #get "/category", to:"categories#index"
end
