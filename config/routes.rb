Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
  get 'your_articles', to: 'articles#your_articles'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end