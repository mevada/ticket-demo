Rails.application.routes.draw do
 
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



  resources :tickets
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
