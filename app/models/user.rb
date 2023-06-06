class User < ApplicationRecord
  has_secure_password
  mount_uploader :avatar, AvatarUploader
  has_many :tags
  has_and_belongs_to_many :tags
end
