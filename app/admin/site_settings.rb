ActiveAdmin.register SiteSetting do
  permit_params :key, :value

  filter :key
  filter :created_at

  index do
    selectable_column
    id_column
    column :key
    column :value
    actions
  end

  form do |f|
    f.inputs "Page Content" do
      f.input :key
      f.input :value, as: :text, input_html: { rows: 6 }
    end
    f.actions
  end
end
