class User < ActiveRecord::Base
  after_initialize :set_default_role, :if => :new_record?
  enum role: [:user, :servant, :admin]

  has_many :appointments
  has_many :events, through: :appointments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :mobile

  def set_default_role
    self.role ||= :user
  end
end
