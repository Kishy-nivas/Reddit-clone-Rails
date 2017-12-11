Rails.application.routes.draw do



  get 'comment/create'

  get 'users/new'
  resources :users

  resource :session


  resources :stories do 
    member do 
      get 'like'
      get 'unlike'
    end 
    resources :comments 
  end  


  #likes for comments 
  get '/stories/:story_id/comments/:id/like' ,to: 'comments#like',as:  'comment_like'
  get '/stories/:story_id/comments/:id/unlike' ,to: 'comments#unlike', as: 'comment_unlike'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'stories#index'
end
