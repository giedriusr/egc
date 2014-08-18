Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users
  devise_scope :user do
    delete '/sign_out', to: 'devise/sessions#destroy', as: 'sign_out'
    get '/sign_in', to: 'devise/sessions#new', as: 'sign_in'
    get '/users/sign_in', to: 'devise/sessions#new', as: 'users_sign_in'
    get '/sign_up', to: 'devise/registrations#new', as: 'sign_up'
    get '/reset_password', to: 'devise/passwords#new', as: 'reset_password'
  end
end
