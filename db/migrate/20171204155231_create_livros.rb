class CreateLivros < ActiveRecord::Migration
  def change
    create_table :livros do |t|
      t.string :titulo
      t.string :nome_autor
      t.integer :qtde_total

      t.timestamps null: false
    end
  end
end
