Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlend
  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
end