Abgair2::Application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    resources :organizations do
      resources :users
      resources :memberships
      resources :membership_type
      resources :events
      resources :teams
    end
  end

  root :to => "home#index"
  
  get '/dashboard' => 'templates#index'
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/  }
end
