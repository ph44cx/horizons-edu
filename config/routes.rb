Rails.application.routes.draw do
  
  scope "(:locale)", locale: /en|ar/ do
    devise_for :users
    root "pages#index"
    resources :blogs
  end
  # match '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  # match '', to: redirect("/#{I18n.default_locale}")
  # resources :blogs
  # devise_for :users
  # root "pages#index"

end
