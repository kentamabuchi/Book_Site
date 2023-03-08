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
    resources :books, only: [:index, :new, :create, :show, :update, :destroy]
    get 'mypage' => 'users#mypage', as: 'mypage'
    get 'profile/edit' => 'users#edit', as: 'profile_edit'
    patch 'profile/edit' => 'users#update'
    resources :users, only: [:show]
  end

  scope module: 'admin' do
    get 'homes/top'
    resources :categories, only: [:index, :create, :update, :destroy]
    resources :genres, only: [:index, :create, :update, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
