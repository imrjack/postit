PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get 'register' => 'users#new' 
  get 'login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  resources :posts, except: [:destroy] do 
    member do
      post :vote 
      delete :unvote     
    end
 
    resources :comments, only:[:create]  do 
      member do 
        post :vote
        
      end
      
    end
  end

  resources :categories, only: [:show, :new, :create]
    
  resources :users, only:[:create, :edit, :update, :show]

end 


