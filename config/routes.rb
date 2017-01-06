Rails.application.routes.draw do
    get 'sessions/new'

    root 'static_pages#main'
    get  '/help',    to: 'static_pages#help'
    get  '/main',    to: 'static_pages#main'

    get  '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'

    get '/login', to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    get '/courses', to: 'others#courses'
    get '/instructors', to: 'others#instructors'
    get '/subjects', to: 'others#subjects'

    # get  '/signin',  to: 'users#old'
    resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
