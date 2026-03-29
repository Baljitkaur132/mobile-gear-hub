class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.string :user_name
      t.string :email
      t.string :address
      t.string :city
      t.integer :province_id
      t.string :postal_code
      t.decimal :subtotal
      t.decimal :gst_amount
      t.decimal :pst_amount
      t.decimal :hst_amount
      t.decimal :total
      t.string :status

      t.timestamps
    end
  end
end
