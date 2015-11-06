ActiveAdmin.register Appointment do

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
    column 'Нотатки', :notice 
    column 'Оплата', :payment
    column 'Оплачено', :paid
    column 'Ступінь', :level
    column 'Зараховано', :done
    actions
  end
end
