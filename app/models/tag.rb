class Tag < ApplicationRecord
  has_many :taggings
  has_many :shops, through: :taggings
  has_and_belongs_to_many :users
end
