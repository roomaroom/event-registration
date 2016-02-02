class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.integer :age
      t.references :appointment, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
