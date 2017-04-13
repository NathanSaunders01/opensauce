Rails.application.routes.draw do
  root to: 'pages#home'
  
  get 'about', to: 'pages#about'
  
  resources :users do
    resource :profile
  end
  
  resources :projects
  
  devise_for :users
  
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  
end
