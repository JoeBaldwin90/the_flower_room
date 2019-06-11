Rails.application.routes.draw do

  resources :products

  root "products#show"

end
