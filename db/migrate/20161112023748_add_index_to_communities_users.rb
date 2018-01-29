class AddIndexToCommunitiesUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :communities_users, [:community_id, :user_id], unique: true
  end
end
