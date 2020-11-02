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
  end

  scope module: :public do
    devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
    }
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
  end
end
