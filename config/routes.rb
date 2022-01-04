Rails.application.routes.draw do
  resources :receipts

  get '/receipt/:id/copy' ,to:'receipts#copy'
  root 'receipts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
