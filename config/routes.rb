Rails.application.routes.draw do
  root to: 'pages#home'
  
  devise_for :users
  
  get 'about', to: 'pages#about'
  
  resources :users do
    resource :profile
    member do
      put :approve
      put :remove
    end
  end
  
  get 'friends', to: 'users#friends'
  
  resources :projects  
  
  resources :skills, except: [:destroy]
  
  resources :categories, except: [:destroy]
  
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  
end
