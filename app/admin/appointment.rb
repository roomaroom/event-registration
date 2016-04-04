ActiveAdmin.register Appointment do
  menu label: "Записи"


  permit_params :notice, :payment, :paid, :level, :done, :mobile, :first_name, :last_name, :sex

  controller do
    def scoped_collection
      Appointment.includes(:user)
    end
  end

  csv do
    column("Прізвище") { |user| user.user.last_name }
    column("Ім'я") { |user| user.user.first_name }
    column("Телефон") { |user| user.user.mobile }
    column("Стать") { |user| user.user.sex }
    column("Вік") do |user|
      (Time.now.to_s(:number).to_i - user.user.birthday.to_time.to_s(:number).to_i)/10e9.to_i if user.user.birthday.present?
    end
    column(:notice)
    column(:payment)
    column(:paid)
    column(:level)
  end

  index do
    column "Ім'я", sortable: 'users.name' do |c|
      c.user.first_name
    end
    column "Прізвище", sortable: 'users.name' do |c|
      c.user.last_name
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
      row "Прізвище" do |c|
        c.user.last_name
      end
      row "Ім'я" do |c|
        c.user.first_name
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
