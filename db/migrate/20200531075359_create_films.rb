class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :type
      t.string :title
      t.text :plot
      t.integer :number
      t.references :parent, foreign_key: {to_table: :films}

      t.timestamps
    end
    add_index :films, :type
  end
end
