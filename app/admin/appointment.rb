ActiveAdmin.register Appointment do
  menu label: "Записи"


  permit_params :notice, :payment, :paid, :level, :done

  controller do
    def scoped_collection
      Appointment.includes(:user)
    end
  end

  index do
    column "Ім'я", sortable: 'users.name' do |c|
      c.user.name
    end
    column "Телефон", sortable: 'users.mobile' do |c|
      c.user.mobile
    end
    column "Стать", sortable: 'users.sex' do |c|
      c.user.sex
    end
    column "Вік", sortable: 'users.birthday' do |c|
      (Time.now.to_s(:number).to_i - c.user.birthday.to_time.to_s(:number).to_i)/10e9.to_i if c.user.birthday.present?
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
