class CreateCommunities < ActiveRecord::Migration[5.0]
  def change
    create_table :communities do |t|
      t.string :name
      t.integer :user_id
      t.integer :status_id
      t.string :avatar
      t.string :banner
      t.timestamps
    end
  end
end
