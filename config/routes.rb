Rails.application.routes.draw do
  resources :products do
    resource :favorites, only: %i[ create destroy ]
  end
  devise_for :users
  root 'tops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
