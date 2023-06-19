class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop

  validates :comment, presence: true
end
