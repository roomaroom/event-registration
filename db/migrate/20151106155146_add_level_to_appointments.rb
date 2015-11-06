class AddLevelToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :level, :integer
    add_column :appointments, :done, :boolean, default: false
  end
end
