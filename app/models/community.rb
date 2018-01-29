class Community < ApplicationRecord
  mount_uploader :banner, BannerUploader
  mount_uploader :avatar, AvatarUploader

  GLOBAL_COMMUNITY = 2

  validates_size_of :banner, maximum: 1.megabyte, message: "Attachment size exceeds the allowable limit ( 1 MB)." # translations needed here
  #class Image < ActiveRecord::Base???

  belongs_to :user
  validates :name, presence: true #TODO name or title pick one


  has_many :multiposts
  has_many :posts, through: :multiposts
  has_and_belongs_to_many :users



# validate :banner
#
#
#
#   def file_size
#      extn = file.file.extension.downcase
#      size = file.file.size.to_f
#      if ["png", "jpg", "jpeg"].include?(extn) && size > 1.megabytes.to_f
#        errors.add(:file, "You cannot upload an image file greater than 5MB")
#      elsif (extn == "pdf") && size > 20.megabytes.to_f
#        errors.add(:file, "You cannot upload an pdf file greater than 20MB")
#      else
#        errors.add(:file, "You cannot upload a file greater than 25MB")
#      end
#    end










  #has_one :image, as: :external , dependent: :destroy

  # accepts_nested_attributes_for :image, reject_if: :image.blank?
  # validates :user, presence: true
  #
  #
  # @path_2 = ":rails_root/images/#{Rails.env}_communities/:external_type/:id/:style/:filename"
  # has_attached_file :banner, styles: { medium: "300x300>", thumb: "100x100>" }, path: @path_2
  # validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/
  #   validates_with AttachmentSizeValidator, attributes: :photo, less_than: 1.megabytes
  #   Paperclip.interpolates :external_type do |attachment, style|
  #       attachment.instance.external.class.to_s.downcase
  #   end
  #
  #   Paperclip.interpolates :external_user do |attachment, style|
  #     user = ""
  #     if attachment.instance.external.class.to_s.downcase == IMAGE_TYPE_POST
  #       user = attachment.instance.external.user_id
  #     #elsif attachment.instance.external.class.to_s.downcase == IMAGE_TYPE_USER
  #     else
  #       user = attachment.instance.external.id
  #     end
  #     user
  #   end




end
