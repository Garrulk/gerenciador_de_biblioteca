class AlugueisController < ApplicationController
	
	def show
		livro = Livro.find(params[:livro_id])
		@alugueis = livro.alugueis
	end

	def create
		livro = Livro.find(params[:livro_id])
		if livro.disponivel?
			aluguel = Aluguel.create(livro: livro, user: current_user,
				data: Date.current)
		else
			flash[:error] = "Quantidade indisponível no momento"

		end
		redirect_to dashboard_index_url
	end

	def destroy
		livro = Livro.find(params[:livro_id])
		aluguel = livro.alugueis.where(user: current_user, alugado: true).last
		if aluguel.present?
			aluguel.update(alugado: false, data_devolucao: Date.current)
		end
		redirect_to dashboard_index_url
	end
end
