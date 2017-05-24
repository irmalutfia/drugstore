Rails.application.routes.draw do
  resources :submajors
  resources :majors
  resources :members
  resources :payment_details
  resources :payments
  resources :purchases
  resources :sales_details
  resources :sales
  resources :prescription_details
  resources :prescriptions
  resources :drugs
  resources :suppliers
  resources :categories
  devise_for :users
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
