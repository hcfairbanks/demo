class Role < ActiveRecord::Base
  ADMIN_ROLE_NAME = "admin"
  USER_ROLE_NAME = "user"
  has_many :assignments
  has_many :users, through: :assignments
  validates :name, presence: true
end
