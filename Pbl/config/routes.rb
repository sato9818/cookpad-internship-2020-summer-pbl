Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes, only: [:new, :create, :index, :show] do
    member do
      get :videos
    end
  end
  resources :videos do
    resource :video_favorites, only: [:create, :destroy]
    resources :video_comments, only: [:create, :destroy]
  end
  root "videos#index"
end
