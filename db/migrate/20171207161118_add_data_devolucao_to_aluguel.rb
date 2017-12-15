class AddDataDevolucaoToAluguel < ActiveRecord::Migration
  def change
    add_column :alugueis, :data_devolucao, :date
  end
end
