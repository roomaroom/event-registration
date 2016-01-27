ActiveAdmin.register Appointment do
  menu label: "Записи"

  permit_params :notice, :payment, :paid, :level, :done
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column "Ім'я" do |c|
      c.user.name
    end
    column "Телефон" do |c|
      c.user.mobile
    end
    column "Стать" do |c|
      c.user.sex
    end
    column "ДН" do |c|
      DateTime.now.year - c.user.birthday.year if c.user.birthday.present?
    end
    column 'Нотатки', :notice
    column 'Оплата', :payment
    column 'Оплачено', :paid
    column 'Ступінь', :level
    column 'Зараховано', :done
    actions
  end

  form do |f|
    f.inputs 'Записи' do
      f.input :notice, label: 'Нотатки'
      f.input :user_id, as: :select,
              collection: User.all,
              include_blank: false
      f.input :event_id, as: :select,
              collection: Event.all,
              include_blank: false
      f.input :payment, label: 'Оплата'
      f.input :paid, label: 'Оплачено'
      f.input :level, label: 'Cтупінь'
      f.input :done, label: 'Зараховано'
    end
    f.actions
  end

  show do |appointment|
    attributes_table do
      row "Ім'я" do |c|
        c.user.name
      end
      row "Телефон" do |c|
        c.user.mobile
      end
      row 'Нотатки' do |c|
        c.notice
      end
      row 'Оплата' do |c|
        c.payment
      end
      row 'Оплачено' do |c|
        c.paid
      end
      row 'Ступінь' do |c|
        c.level
      end
      row 'Зараховано' do |c|
        c.done
      end
    end
  end
end
