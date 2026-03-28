class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :stock_quantity
      t.string :category
      t.boolean :is_on_sale
      t.boolean :is_new
      t.string :image

      t.timestamps
    end
  end
end
