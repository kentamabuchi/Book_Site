Rails.application.routes.draw do

  root to: 'public/homes#top'

  devise_for :users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }

  devise_for :admins, controllers: {
    sessions: 'admin/admins/sessions',
    registrations: 'admin/admins/registrations'
  }

  scope module: 'public' do
    resources :homes, only: [:top, :about]

    resources :books, only: [:index, :new, :create, :show, :update, :destroy] do
      resources :reviews, only: [:show, :create, :update, :destroy] do
        resource :good_reviews, only: [:create, :destroy]
      end
    end

    get 'mypage' => 'users#mypage', as: 'mypage'
    get 'mypage/follow' => 'relationships#my_follow', as: 'mypage_follow'
    get 'mygege/follower' => 'relationships#my_follower', as: 'mypage_follower'

    get 'profile/edit' => 'users#edit', as: 'profile_edit'
    patch 'profile/edit' => 'users#update'

    post 'review/:parent_id/reply' => 'reviews#reply', as: 'reply'

    get 'user/:id/follow' => 'relationships#follow', as: 'follow'
    get 'user/:id/follower' => 'relationships#follower', as: 'follower'

    resources :users, only: [:show] do
      resource :relationships, only: [:create, :destroy]
    end
  end

  scope module: 'admin' do
    get 'homes/top'
    resources :categories, only: [:index, :create, :update, :destroy]
    resources :genres, only: [:index, :create, :update, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
