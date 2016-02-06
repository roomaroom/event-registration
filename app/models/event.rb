class Event < ActiveRecord::Base
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
  mount_uploader :photo, ImageUploader

  geocoded_by :address
  after_validation :geocode
end
