Abgair2::Application.routes.draw do
  devise_for :users, :skip => [:sessions]
  as :user do
    post   '/api/v1/login'   => 'sessions#create'
    delete '/api/v1/logout'  => 'sessions#destroy'
  end

  namespace :api, defaults: {format: :json} do
    resources :organizations do
      resources :users
      resources :memberships
      resources :membership_types
      resources :events
      resources :teams
    end
  end

  root :to => "home#index"
  
  get '/dashboard' => 'templates#index'
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/  }
end
