Rails.application.routes.draw do

  resources :words, except: [:new, :edit]

  match "*path", to: "words#index", via: "get"

  root "words#index"

end
