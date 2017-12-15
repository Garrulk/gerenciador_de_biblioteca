class DashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		@livros = Livro.order :titulo
	end

end
