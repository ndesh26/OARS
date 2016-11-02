Rails.application.routes.draw do
    resources :courses do
        resources :course_requests
    end
    get 'sessions/new'
    resources :users do
        resources :course_completeds
        member do
            get 'request_course'
        end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'users#index'
    get '/login', to:'sessions#new'
    post '/login', to:'sessions#create'
    delete '/logout', to: 'sessions#destroy'
end
