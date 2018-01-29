class Conversation < ActiveRecord::Base

  has_many :conversationalists, dependent: :destroy
  has_many :users, through: :conversationalists
  has_many :messages, dependent: :destroy

  accepts_nested_attributes_for :messages
end
