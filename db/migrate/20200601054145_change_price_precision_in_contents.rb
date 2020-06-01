class ChangePricePrecisionInContents < ActiveRecord::Migration[6.0]
  def change
    change_column :contents, :price, :decimal, precision: 10, scale: 2
  end
end
