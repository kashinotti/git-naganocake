Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/regitrations'
    }
    get '/' => 'homes#top'
    resources :items, only: [:create, :index, :new, :edit, :update,:show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
     resources :order_details, only: [:update]
    end
  end

  scope module: :public do
    devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
    }
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/customer/customer_edit' =>"customers#edit", as: 'edit_customer'
    patch '/customers/update' => "customers#update", as: 'update_customer'
    resource :customers, only: [:show]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items/:id/destroy_all' => 'cart_items#destroy_all', as: 'cart_items_destroy_all'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    put "/customers/:id/withdraw" => "customers#withdraw", as: 'customer_withdraw'
    get '/orders/complete' => 'orders#complete', as: 'orders_complete'
    resources :orders, only: [:index, :show, :new, :create]
    post '/orders/confirm' => 'orders#confirm', as: 'orders_confirm'

  end

end
