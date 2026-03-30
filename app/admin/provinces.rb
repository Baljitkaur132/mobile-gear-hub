ActiveAdmin.register Province do
  permit_params :name, :code, :gst, :pst, :hst

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
    f.inputs "Province Tax Rates" do
      f.input :name
      f.input :code
      f.input :gst, label: "GST %"
      f.input :pst, label: "PST %"
      f.input :hst, label: "HST %"
    end
    f.actions
  end
end
