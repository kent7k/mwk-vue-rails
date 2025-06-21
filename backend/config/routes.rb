Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'

  # Web 版の認証が不要ならコメントアウト
  # devise_for :users

  namespace :api do
    namespace :v1, format: :json do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'auth/registrations'
      }

      get  'isLike',         to: 'post_likes#isLike'
      get  'isJoin',         to: 'post_joins#isJoin'
      get  'allpost',        to: 'posts#allpost'
      get  'new_post',       to: 'posts#new_post'
      get  'new_plan_post',  to: 'posts#new_plan_post'

      resources :posts,  only: %i[index show create update destroy] do
        get :search, on: :collection
      end
      resources :users,  only: %i[index show create destroy] do
        get :search, on: :collection
      end
      resources :messages,      only: %i[index create update destroy]
      resources :pickups,       only: %i[index create destroy]
      resource  :relationships, only: %i[create destroy]
      resource  :post_likes,    only: %i[create destroy]
      resource  :post_joins,    only: %i[create destroy]
      resource  :message_likes, only: %i[create destroy]

      get 'health_check', to: 'health_check#index'
    end
  end
end
