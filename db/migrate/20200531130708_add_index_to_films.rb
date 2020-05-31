class AddIndexToFilms < ActiveRecord::Migration[6.0]
  def change
    add_index :films, :created_at
  end
end
