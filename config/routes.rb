Rails.application.routes.draw do
  devise_for :users
  resources :categories, except: [:update, :edit, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  root "categories#index"
end
