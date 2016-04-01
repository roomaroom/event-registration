namespace :user do
  task name: :environment do
    User.find_each do |u|
      if u.first_name.blank?
        u.first_name = u.name.split(" ").first
        u.last_name = u.name.split(" ").last
        u.save
      end
    end
  end
end
