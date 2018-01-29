class CreateCommunitiesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :communities_users do |t|
      t.integer :community_id
      t.integer :user_id
    end
  end
end
