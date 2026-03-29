Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root "products#index"
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  get  "/cart",              to: "cart#show",       as: "cart"
  post "/cart/add/:id",      to: "cart#add",        as: "add_to_cart"
  patch "/cart/update/:id",  to: "cart#update",     as: "update_cart"
  delete "/cart/remove/:id", to: "cart#remove",     as: "remove_from_cart"

  get  "/checkout",          to: "checkout#new",    as: "checkout"
  post "/checkout",          to: "checkout#create"
  get  "/checkout/confirm",  to: "checkout#confirm", as: "checkout_confirm"

  get "/orders", to: "orders#index", as: "orders"
end
