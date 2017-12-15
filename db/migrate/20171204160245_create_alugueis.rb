class CreateAlugueis < ActiveRecord::Migration
  def change
    create_table :alugueis do |t|
      t.integer :user_id
      t.date :data
      t.boolean :alugado, default: true
      t.integer :livro_id

      t.timestamps null: false
    end
  end
end
