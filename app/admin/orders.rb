ActiveAdmin.register Order do
  permit_params :status

  filter :user_name
  filter :email
  filter :status
  filter :created_at

  index do
    selectable_column
    id_column
    column :user_name
    column :email
    column :province do |order|
      order.province.name
    end
    column :total do |order|
      number_with_precision(order.total, precision: 2)
    end
    column :status do |order|
      status_tag order.status
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :user_name
      row :email
      row :address
      row :city
      row :province
      row :postal_code
      row :subtotal
      row :gst_amount
      row :pst_amount
      row :hst_amount
      row :total
      row :status
      row :created_at
    end
    panel "Order Items" do
      table_for order.order_items do
        column :product_name
        column :quantity
        column :unit_price
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :status, as: :select,
              collection: ["pending", "paid", "shipped"]
    end
    f.actions
  end
end
