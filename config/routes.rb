Rails.application.routes.draw do
  resources :work_types
  root 'courses#index'
  resources :users, only: [:index, :show, :new, :create, :update]

  resources :courses, only: [:index, :new, :create, :edit]
  put '/courses/:id' => 'courses#update', as: :course
  patch '/courses/:id' => 'courses#update'

  resources :iteration_days

  resource :sessions, only: [:new, :destroy]
  post '/sessions' => 'sessions#create', as: :session
end
