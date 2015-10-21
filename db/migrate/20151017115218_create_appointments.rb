class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.text :notice
      t.integer :payment
      t.integer :paid

      t.timestamps null: false
    end
  end
end
