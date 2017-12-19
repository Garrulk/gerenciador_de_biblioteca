Rails.application.routes.draw do

	devise_for :users

	root to: "pages#index"

	resources :users, only: [:index]
	resources :dashboard, only: [:index]
	resources :livros, only: [:create, :new, :destroy, :edit, :update] do
		resource :alugueis	
	end
end
