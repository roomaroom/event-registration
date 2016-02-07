ActiveAdmin.register Event do
  menu label: "Події"

  permit_params :title, :start_time, :end_time, :description, :address, :photo

  index do
    column 'Заголовок', :title
    column 'Початок', :start_time
    column 'Закінчення', :end_time
    column 'Адрес', :address
    column 'Фото', :photo
    actions
  end

  form do |f|
    f.inputs 'Події' do
      f.input :title, label: 'Заголовок'
      f.input :description, label: 'Опис', as: :html_editor
      f.input :start_time, label: 'Початок'
      f.input :end_time, label: 'Закінчення'
      f.input :address, label: 'Адрес'
      f.input :photo, label: 'Фото'
    end
    f.actions
  end

  show do |appointment|
    attributes_table do
      row "Заголовок" do |c|
        c.title
      end
      row "Опис" do |c|
        c.description
      end
      row 'Початок' do |c|
        c.start_time
      end
      row 'Закінчення' do |c|
        c.end_time
      end
      row 'Адрес' do |c|
        c.address
      end
      row 'Фото' do |c|
        c.photo
      end
    end
  end
end
