ActiveAdmin.register Shipment do
  permit_params :user_id, :source, :destination, :status

  index do
    selectable_column
    id_column
    column :user
    column :source
    column :destination
    column :status
    actions
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :source
      f.input :destination
      f.input :status, as: :select, collection: Shipment.statuses.keys
    end
    f.actions
  end
end
