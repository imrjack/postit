PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get 'register' => 'users#new' 
  get 'login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sesssions#destroy'


  resources :posts, except: [:destroy] do 
    resources :comments, only:[:create]
  end

  resources :categories, only: [:show, :new, :create]
    
  resources :users, only:[:create, :edit, :update, :destroy]
end 


