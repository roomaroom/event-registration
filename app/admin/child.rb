ActiveAdmin.register Child do
  menu label: "Діти"

  permit_params :name, :age, :payment, :paid

  index do
    column "Ім'я", :name
    column 'Вік', :age
    column 'Оплата', :payment
    column 'Оплачено', :paid
    column 'Подія', sortable: 'appointment_id' do |c|
      c.appointment.event.title
    end
    actions
  end

  form do |f|
    f.inputs 'Дитина' do
      f.input :name, label: "Ім'я"
      f.input :age, label: 'Вік'
      f.input :payment, label: 'Оплата'
      f.input :paid, label: 'Оплачено'
    end
    f.actions
  end

  # show do |appointment|
  #   attributes_table do
  #     row "Заголовок" do |c|
  #       c.title
  #     end
  #     row "Опис" do |c|
  #       c.description
  #     end
  #     row 'Початок' do |c|
  #       c.start_time
  #     end
  #     row 'Закінчення' do |c|
  #       c.end_time
  #     end
  #     row 'Адрес' do |c|
  #       c.address
  #     end
  #     row 'Фото' do |c|
  #       c.photo
  #     end
  #   end
  # end
end
