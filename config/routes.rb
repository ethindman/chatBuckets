Rails.application.routes.draw do
  devise_for :users

  root 'question_lists#index'

  resources :users, only: [:index, :show]

  resources :question_lists do
    resources :question_list_items
  end
end
