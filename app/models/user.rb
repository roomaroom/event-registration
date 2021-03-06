class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include TheComments::User

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :authentication_keys => { login: true, email: false}
  after_initialize :set_default_role, :if => :new_record?

  attr_accessor :login

  enum role: [:user, :servant]
  enum sex: [:male, :female]

  has_many :appointments
  has_many :events, through: :appointments

  validates_presence_of :first_name, :last_name, :mobile, :city, :email, :sex, :birthday
  validates :mobile, format: { with: /\+?\d{1,4}?[-\s]?\(?\d{1,3}?\)?[-\s]?\d{1,4}[-\s]?\d{1,4}[-\s]?\d{1,9}/,
            message: 'Неправильний формат телефону' }

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(mobile) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  def full_name
    "#{last_name} #{first_name}"
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

  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end


  def admin?
    servant?
  end

  def comments_admin?
    servant?
  end

  def comments_moderator? comment
    id == comment.holder_id
  end
end
