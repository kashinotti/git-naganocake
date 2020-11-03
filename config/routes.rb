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
  end

  scope module: :public do
    devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
    }
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resource :customers
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    put "/customers/:id/withdraw" => "customers#withdraw", as: 'customer_withdraw'
  end

end
