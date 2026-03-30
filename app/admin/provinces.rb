ActiveAdmin.register Province do
  permit_params :name, :code, :gst, :pst, :hst

  filter :name
  filter :code
  filter :gst
  filter :pst
  filter :hst

  index do
    selectable_column
    id_column
    column :name
    column :code
    column :gst
    column :pst
    column :hst
    actions
  end

  form do |f|
    f.inputs "Province Details" do
      f.input :name
      f.input :code
      f.input :gst, label: "GST %"
      f.input :pst, label: "PST %"
      f.input :hst, label: "HST %"
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :code
      row :gst
      row :pst
      row :hst
      row :created_at
      row :updated_at
    end
  end
end
