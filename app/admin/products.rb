ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity,
                :category_id, :is_on_sale, :is_new, :image

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :price
    column :stock_quantity
    column :is_on_sale
    column :is_new
    column :image do |product|
      if product.image.attached?
        image_tag product.image, height: 50
      end
    end
    actions
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :category
      f.input :is_on_sale
      f.input :is_new
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :stock_quantity
      row :category
      row :is_on_sale
      row :is_new
      row :image do |product|
        image_tag product.image, height: 100 if product.image.attached?
      end
      row :created_at
      row :updated_at
    end
  end
end
