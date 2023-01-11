Rails.application.routes.draw do
  resources :constituencies
  resources :candidates do
    member do
      get "like" => "candidates#upvote"
      get "unlike" => "candidates#downvote"
    end
  end
  
  # devise_for :users
  # root 'home#index'
  get 'pages/home'
  get 'home/image'
  
  # root 'home#index'
  root to: 'candidates#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

end
