Rails.application.routes.draw do
  root 'welcome#index'

  resources :fitness_records
end
