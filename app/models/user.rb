# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  role_id                :string(255)
#

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
  accepts_nested_attributes_for :profile, allow_destroy:  true

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
