Rails.application.routes.draw do
  resources :courses
    resources :users do
        resources :course_completeds
        member do
            get 'request_course'
        end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'users#index'
end
