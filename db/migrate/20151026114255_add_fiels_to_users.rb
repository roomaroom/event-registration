class AddFielsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobile, :integer
    add_column :users, :level, :integer
    add_column :users, :city, :string
    add_column :users, :community, :string
  end
end
