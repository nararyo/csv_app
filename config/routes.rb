Rails.application.routes.draw do
  get '/users/csv_data', to: 'users#csv_data'
  resources :users

  
end
