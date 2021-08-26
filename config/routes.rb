Rails.application.routes.draw do
  devise_for :customers, controllers: { registrations: 'customer/registrations' }
  
  devise_for :admins, path: 'admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlend
  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :public, path: "" do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show, :create]
    root to: "homes#top" 
    get '/about' => 'homes#about'
    resource :customers, only: [:show]
    get 'customers/unsubscribe/' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/withdraw/' => 'customers#withdraw', as: 'withdraw_customer'
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end
    # delete 'cart_items/destroy_all', to: 'cart_items#destroy_all', as: 'destroy_all_cart_items'
  end
end