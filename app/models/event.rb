class Event < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments
  mount_uploader :photo, ImageUploader
end
