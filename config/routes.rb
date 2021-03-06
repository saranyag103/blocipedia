Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  # FIXME route broken
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :wikis do
    resources :collaborations, only: [:destroy, :create]
  end
  get 'about' => 'welcome#about'
  resources :charges, only: [:new, :create]
  resources :downgrade, only: [:new, :create]
  # delete 'collaborations', to: 'collaborations#destroy'
  #
  # post 'collaborations', to: 'collaborations#create'
end
