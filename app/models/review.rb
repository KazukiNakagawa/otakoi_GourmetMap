class Review < ApplicationRecord
  belongs_to :shop
  after_create :update_shop_star_rating
  after_update :update_shop_star_rating
  
  def update_shop_star_rating
    shop.update_star_rating
  end
end