ActiveAdmin.register User do
  menu label: "Користувачі"
  permit_params :email, :password, :password_confirmation, :role

  index do
    selectable_column
    column :email
    column :name
    column :role
    column :mobile
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  show do |user|
    attributes_table do
      row :email
      row :name
      row :city
      row :community
      row :role
      row :created_at
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :role, as: :select,
            collection: User.roles.keys,
            include_blank: false
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def update
      params[:user].delete_if {|key, value| value.blank? }
      super
    end
  end
end
