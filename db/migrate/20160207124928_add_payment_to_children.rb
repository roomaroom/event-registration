class AddPaymentToChildren < ActiveRecord::Migration
  def change
    add_column :children, :payment, :integer
    add_column :children, :paid, :integer
  end
end
