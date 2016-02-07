class Child < ActiveRecord::Base
  belongs_to :appointment
  validates_presence_of :name, :age

  enum payment: { '50грн'=> 50, 'Інше (написати у примітках)'=> 0 }
end
