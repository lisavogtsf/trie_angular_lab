Rails.application.routes.draw do

	root to: "words#index"
	resources :words, except: [:new, :edit]
	resources :book_templates

end
