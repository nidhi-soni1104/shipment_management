ActiveAdmin.register User do
  permit_params :email, :password, :role

  index do
    selectable_column
    id_column
    column :email
    column :role
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :role, as: :select, collection: User.roles.keys
    end
    f.actions
  end
end
