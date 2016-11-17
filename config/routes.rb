Rails.application.routes.draw do
  root 'appointments#index'

  resources :doctors
  resources :patients
  resources :appointments, only: [:index, :new, :create, :destroy]

end
