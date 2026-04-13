ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity,
                :category_id, :is_on_sale, :is_new, :image,
                tag_ids: []
  filter :name
  filter :category
  filter :price
  filter :is_on_sale
  filter :is_new
  filter :created_at
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
      begin
        if product.image.attached?
          image_tag rails_blob_url(product.image), height: 50
        end
      rescue
        "No image"
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
      f.input :tags, as: :check_boxes, collection: Tag.all
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
      row :tags
      row :is_on_sale
      row :is_new
      row :image do |product|
        begin
          if product.image.attached?
            image_tag rails_blob_url(product.image), height: 100
          end
        rescue
          "No image"
        end
      end
      row :created_at
      row :updated_at
    end
  end
end
