class CreateConversationalists < ActiveRecord::Migration[5.0]
  def change
    create_table :conversationalists do |t|
      t.references :user, foreign_key: true
      t.references :conversation, foreign_key: true
    end
  end
end
