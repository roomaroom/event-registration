class Event < ActiveRecord::Base
  default_scope  { order('created_at DESC') }

  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
  mount_uploader :photo, ImageUploader

  geocoded_by :address
  after_validation :geocode
end
