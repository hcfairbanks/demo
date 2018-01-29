class CreateMultipost < ActiveRecord::Migration[5.0]
  def change
    create_table :multiposts do |t|
      t.integer :community_id
      t.integer :post_id
    end
  end
end
