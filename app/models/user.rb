class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_initialize :set_default_role, :if => :new_record?

  attr_accessor :login

  enum role: [:user, :servant, :admin]

  has_many :appointments
  has_many :events, through: :appointments

  validates_presence_of :name, :mobile

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(mobile) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  def set_default_role
    self.role ||= :user
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.mobile || self.email
  end
end
