Rails.application.routes.draw do
  namespace :public do
    get 'books/index'
    get 'books/show'
    get 'books/new'
    post 'books/create'
  end
  devise_for :users
  root to: 'public/homes#top'
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
