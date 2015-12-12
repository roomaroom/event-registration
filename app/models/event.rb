class Event < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments
  mount_uploader :photo, ImageUploader

  geocoded_by :address
  after_validation :geocode
end
