require 'open-uri'
require 'json'

class Shop < ApplicationRecord
  validates :name, presence: true
  validates :explantory_text, presence: true
  has_one_attached :image
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :reviews
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks
  accepts_nested_attributes_for :tags, allow_destroy: true

# タグ名をカンマ区切りで受け取って関連付ける
def tag_names=(names)
  self.tags = names.split(",").map do |name|
    Tag.find_or_create_by(name: name.strip)
  end
end
  
# タグ名をカンマ区切りの文字列として返す
def tag_names
  tags.pluck(:name).join(", ")
end

def reviews
  Review.where(shop_id: id)
end

end
