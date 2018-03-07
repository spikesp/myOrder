Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :fitness_records do
    resources :fitness_moves
  end


end
