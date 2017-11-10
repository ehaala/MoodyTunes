Rails.application.routes.draw do
  root 'main#index'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  resources :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
