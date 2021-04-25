Rails.application.routes.draw do
  get 'reviews/create'
  resources :favorites, only: %i[ index ]
  resources :products do
    resource :favorites, only: %i[ create destroy ]
    resources :reviews
  end
  devise_for :users
  resources :carts do
    collection do
      get 'my_cart'
      post 'add_item'
      post 'update_item'
      delete 'delete_item'
    end
  end
  root 'tops#index'
  resources :orders do
    collection do
      post :confirm
      get :complete
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
