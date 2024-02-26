Rails.application.routes.draw do

  get '/user', to: 'user#new'

  post '/user', to: 'user#create'

  get 'login', to: 'login#login'
  post 'login', to: 'login#loginPost'

  get 'newTask', to: 'tasks#new'
  get 'dashboard', to: 'login#Dashboard'


  post 'tasks', to: 'tasks#create'

  get 'tasks', to: 'tasks#show'

  get '/review', to: 'tasks#review'
  post 'review', to: 'tasks#review'

  get "up" => "rails/health#show", as: :rails_health_check

end
