ActiveAdmin.register Tag do
  permit_params :name

  filter :name
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :products_count do |tag|
      tag.products.count
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
    panel "Products with this tag" do
      table_for tag.products do
        column :name
        column :category
        column :price
      end
    end
  end
end
