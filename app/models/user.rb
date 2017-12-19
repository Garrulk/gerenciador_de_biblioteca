class User < ActiveRecord::Base

  has_many :alugueis

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def possui_alugueis_ativos?
  	alugueis.where(alugado: true).present?
  end
end
