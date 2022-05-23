Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  root "application#home"
end
