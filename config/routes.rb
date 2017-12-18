Rails.application.routes.draw do

	devise_for :users

	root to: "pages#index"

	resources :dashboard, only: [:index]
	resources :livros, only: [:create, :new, :destroy, :edit, :update] do
		resources :alugueis
		get :aluga, on: :member
		get :devolve, on: :member
		# get :lista_aluguel, on: :member
	end
end
