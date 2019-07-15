Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products do
    resources :order_items
  end

  resource :cart

  resources :orders

  get "info", to: "pages#info"
  get "contact", to: "pages#contact"
  get "events", to: "pages#events"

  root "pages#home"

end
