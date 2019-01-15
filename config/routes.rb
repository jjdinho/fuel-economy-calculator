Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cars#home'
  get '/cars', to: 'cars#year', as: :year
  get '/cars/:year', to: 'cars#make', as: :get_makes
  get '/cars/:year/:make', to: 'cars#model', as: :get_model
  get '/api/get_info', to: 'cars#get_info', as: :get_info
end

