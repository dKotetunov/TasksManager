# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  description :string(255)
#  user_id     :integer
#

class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  validates_presence_of :name

  attr_accessible :name, :description, :user_id

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
