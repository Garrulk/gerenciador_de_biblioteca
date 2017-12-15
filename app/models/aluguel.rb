class Aluguel < ActiveRecord::Base
	belongs_to :user
	belongs_to :livro

	
end
