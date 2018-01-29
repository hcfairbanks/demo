class Post < ActiveRecord::Base
  MIN_PRICE = "0"
  MAX_PRICE = "1000000000"
  MAX_DAYS_SEARCH = 80

  has_many :multiposts
  has_many :communities, through: :multiposts

  belongs_to :user
  has_many :comments , dependent: :destroy
  has_many :photos, as: :external , dependent: :destroy

  accepts_nested_attributes_for :photos

  validates :title, presence: true
  validates :price, presence: true, numericality: true
  validates_format_of :price, with: /\A\d{1,4}(.\d{0,2})?\z/
  validates :user, presence: true

end
