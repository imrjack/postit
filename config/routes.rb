PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/new' => 'users#new'
  post '/register' => 'users#create'

  resources :posts, except: [:destroy] do 
    resources :comments, only:[:create]
  end

  resources :categories, only: [:show, :new, :create]
    


end 


