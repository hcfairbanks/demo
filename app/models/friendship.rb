class Friendship < ActiveRecord::Base
  PENDING = 0
  APPROVED = 1
  BLOCKED = 2

  belongs_to :user
  belongs_to :friend, class_name: "User"
  validates_uniqueness_of :user_id, scope: [:friend_id]
  validates_uniqueness_of :friend_id, scope: [:user_id]

end
