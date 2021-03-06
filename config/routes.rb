Rails.application.routes.draw do
  root 'static_pages#feed'

  devise_for :users

  resources :users do
    member do
      get :following, :followers, :cards, :journals
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :question_lists do
    resources :question_list_items
  end

  resources :cards
  resources :journals

  get '/welcome', to: 'static_pages#welcome'

end
