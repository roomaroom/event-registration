class Child < ActiveRecord::Base
  belongs_to :appointment
  validates_presence_of :name, :age
end
