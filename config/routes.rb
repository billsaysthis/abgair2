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
end
