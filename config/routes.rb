Rails.application.routes.draw do
  resources :course_stores
  resources :instructors
    resources :requests,    only: [:create, :destroy, :update]
    resources :courses do
        member do
            get :accept_requests
        end
    end
    get 'sessions/new'   
    resources :users do
              member do
            get :request_course
            get :courses
        end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'users#index'
    get '/login', to:'sessions#new'
    post '/login', to:'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/error', :to => redirect('/404.html')
    get '/error', to:'instructors#show'
end
