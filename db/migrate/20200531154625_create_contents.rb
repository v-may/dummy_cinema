class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.references :film, null: false, foreign_key: true
      t.references :quality, null: false, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
