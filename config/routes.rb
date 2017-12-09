Rails.application.routes.draw do



  get 'users/new'
  resources :users 

  resource :session

  resources :stories do 
    resources :votes 
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
end
