Rails.application.routes.draw do
  root 'welcome#index'

  resources :fitness_records do
    resources :fitness_moves
  end

end
