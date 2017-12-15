class Livro < ActiveRecord::Base

	has_many :alugueis

	def quantidade_alugada
		alugueis.where(alugado: true).count
	end

	def quantidade_disponivel
		qtde_total - quantidade_alugada
	end

	def disponivel?
		quantidade_disponivel > 0
	end

end
