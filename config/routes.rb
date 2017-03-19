Rails.application.routes.draw do
  resources :blogs
  devise_for :users
  root "pages#index"

end
