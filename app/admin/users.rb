ActiveAdmin.register User do
  permit_params :name, :email, :address, :city, :postal_code, :province_id

  filter :name
  filter :email
  filter :city
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :address
    column :city
    column :province
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :address
      row :city
      row :postal_code
      row :province
      row :created_at
    end
  end
end

ActiveAdmin.register User do
  def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "email", "id", "name", "postal_code", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
