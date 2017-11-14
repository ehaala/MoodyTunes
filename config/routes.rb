Rails.application.routes.draw do
  root 'main#index'

  get 'results' => 'main#show'

  post 'results' => 'main#show'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  resources :user
  resources :main
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
