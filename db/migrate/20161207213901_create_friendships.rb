class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships,id: false do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :status
    end
  end
end
