Rails.application.routes.draw do
  resources :question_lists do
      resources :question_list_items
    end
  root 'question_lists#index'
end
