class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :role, :email, :password, :profile_attributes, :password_confirmation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  belongs_to :role
  has_many :tasks
  has_many :comments
  has_one :profile
  accepts_nested_attributes_for :profile, :allow_destroy => true

  delegate :admin?, :moderator?, :simple_user?, to: :role
  delegate :fullname, :initials, to: :profile
  before_create :set_default_role

  scope :simple, -> { where(role_id: Role.user.id) }
  scope :moderator, -> { where(role_id: Role.moderator.id) }

  private

  def set_default_role
    self.role ||= Role.user
  end
end
