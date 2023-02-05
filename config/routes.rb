Rails.application.routes.draw do
  scope module: 'public' do
    resources :books, only: [:index, :new, :create, :show, :update, :destroy]
  end
  devise_for :users
  root to: 'public/homes#top'
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
