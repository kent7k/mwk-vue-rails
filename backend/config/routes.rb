# frozen_string_literal: true

Rails.application.routes.draw do
namespace :api do
  namespace :v1, format: :json do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: { registrations: 'auth/registrations' }

    resources :posts, only: %i[index show create update destroy] do
        # /api/v1/posts/:post_id/like  の 1 本に統一
        resource :like, only: %i[show create destroy],
                 controller: :post_likes
    end

    resources :users, only: %i[index show create destroy] do
      get :search, on: :collection
    end

    # そのほか既存ルート
    resources :messages, only: %i[index create update destroy]
    resources :pickups,  only: %i[index create destroy]
    resource  :relationships, only: %i[create destroy]
    resource  :post_joins,    only: %i[create destroy]
    resource  :message_likes, only: %i[create destroy]

    get 'health_check', to: 'health_check#index'
  end
end
end
