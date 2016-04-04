ActiveAdmin.register User do
  menu label: "Користувачі"
  permit_params :email, :password, :password_confirmation, :role, :first_name, :last_name

  index do
    selectable_column
    column :email
    column :name
    column :first_name
    column :last_name
    column :role
    column :mobile
    column :sex
    column :city
    column :birthday
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  show do |user|
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :city
      row :community
      row :role
      row :sex
      row :birthday
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
      f.input :first_name
      f.input :last_name
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
