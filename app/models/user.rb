class User < ApplicationRecord
  has_secure_password
  mount_uploader :avatar, AvatarUploader
  has_many :shops, through: :bookmarks
  has_many :tags
  has_and_belongs_to_many :tags
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
