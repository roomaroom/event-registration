class Event < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments
  has_many :children
  mount_uploader :photo, ImageUploader

  geocoded_by :address
  after_validation :geocode
end
