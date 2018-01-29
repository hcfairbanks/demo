class User < ActiveRecord::Base

  has_many :conversationalists
  has_many :conversations, :through => :conversationalists
  has_many :messages

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user



  after_create :default_role

  # http://stackoverflow.com/questions/8186584/how-do-i-set-up-email-confirmation-with-devise
  # https://github.com/plataformatec/devise/wiki/How-To:-Add-:confirmable-to-Users
  # https://www.youtube.com/watch?v=tkvXjYRNYmU

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # acts_as_authentic # For Authlogic

  # validates :first_name, presence: true
  # validates :role_ids, presence: true

  # validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  # validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true



  has_many :assignments
  has_many :roles, through: :assignments

  has_many :posts, dependent: :destroy
  has_many :comments
  has_and_belongs_to_many :communities
  # has_one :image, as: :external , dependent: :destroy
  # accepts_nested_attributes_for :image, reject_if: :image.blank?


  mount_uploader :avatar, AvatarUploader


  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  def is_admin?
    has_role_by_name?(Role::ADMIN_ROLE_NAME)
  end

  def is_user?
    has_role_by_name?(Role::USER_ROLE_NAME)
  end

  private
  def default_role
    role_id = Role.find_by_name(Role::USER_ROLE_NAME).id
    self.assignments.create(role_id: role_id)
  end

  def has_role_by_name?(role_name)
    self.roles.each do | role_object |
      if role_object.name == role_name
        return true
      end
    end
    false
  end

end
