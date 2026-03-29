class AddUserIdToOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :user_id, :integer
  end
end
