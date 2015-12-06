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

  def set_default_role
    self.role ||= :user
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
end
