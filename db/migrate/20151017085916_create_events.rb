class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.string :address
      t.string :photo

      t.timestamps null: false
    end
  end
end
