ActiveAdmin.register Order do
  permit_params :status

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
      row :province do |order|
        order.province.name
      end
      row :postal_code
      row :subtotal do |order|
        number_with_precision(order.subtotal, precision: 2)
      end
      row :gst_amount do |order|
        number_with_precision(order.gst_amount, precision: 2)
      end
      row :pst_amount do |order|
        number_with_precision(order.pst_amount, precision: 2)
      end
      row :hst_amount do |order|
        number_with_precision(order.hst_amount, precision: 2)
      end
      row :total do |order|
        number_with_precision(order.total, precision: 2)
      end
      row :status
      row :created_at
    end

    panel "Order Items" do
      table_for order.order_items do
        column :product_name
        column :quantity
        column :unit_price do |item|
          number_with_precision(item.unit_price, precision: 2)
        end
        column "Subtotal" do |item|
          number_with_precision(item.unit_price * item.quantity, precision: 2)
        end
      end
    end
  end

  form do |f|
    f.inputs "Update Order Status" do
      f.input :status, as: :select, collection: ["pending", "paid", "shipped"]
    end
    f.actions
  end

  filter :user_name
  filter :email
  filter :status
  filter :created_at
end
