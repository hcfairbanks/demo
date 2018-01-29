class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :avatar
      t.string :title
      t.float :price
      t.string :content
      t.timestamps null: false
    end
  end
end
