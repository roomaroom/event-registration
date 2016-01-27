class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sex, :integer
    add_column :users, :birthday, :datetime
  end
end
