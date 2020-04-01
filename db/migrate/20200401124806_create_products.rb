class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :sku
      t.integer :list_price
      t.integer :sell_price
      t.integer :stock
      t.integer :status

      t.timestamps
    end
  end
end
