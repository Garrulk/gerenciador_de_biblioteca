class LivrosController < ApplicationController
	before_action :verifica_admin, only: [:new]
	
	def new
	end

	def create
		valores = params.require(:livro).permit :titulo, :nome_autor, :qtde_total
		livro = Livro.create valores
		redirect_to dashboard_index_url
	end

	def aluga
		livro = Livro.find(params[:id])
		if livro.disponivel?
			aluguel = Aluguel.create(livro: livro, user: current_user,
				data: Date.current)
		else
			flash[:error] = "Quantidade indisponível no momento"

		end
		redirect_to dashboard_index_url
	end

	def devolve
		livro = Livro.find(params[:id])
		aluguel = livro.alugueis.where(user: current_user, alugado: true).last
		if aluguel.present?
			aluguel.update(alugado: false, data_devolucao: Date.current)
		else
			flash[:warning] = "Você não tem esse livro alugado."

		end
		redirect_to dashboard_index_url
	end

	private

	def verifica_admin
		if !current_user.admin?
			flash[:error] = "Somente o administrador pode cadastrar livros."
			redirect_to dashboard_index_url
		end
	end

end
