Rails.application.routes.draw do
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end
  root to: 'splash#index'
  devise_for :users
  resources :categories, except: [:show, :update, :edit, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
end
