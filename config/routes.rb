Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users

  resources :users, only: [:index, :show]

  resources :question_lists do
    resources :question_list_items
  end

  resources :cards

end
