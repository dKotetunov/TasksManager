class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :role, :email, :password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  belongs_to :role
  has_many :tasks
  has_many :comments
  has_one :profile

  delegate :admin?, :moderator?, :simple_user?, to: :role
  delegate :fullname, :initials, to: :profile
  before_create :set_default_role
  after_create :set_default_profile

  scope :simple, -> { where(role_id: Role.user.id) }

  private

  def set_default_role
    self.role ||= Role.user
  end

  def set_default_profile
    self.create_profile
  end
end
