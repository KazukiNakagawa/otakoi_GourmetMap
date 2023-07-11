class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop

  validates :content, presence: { message: 'コメントを入力してください' }
  validates :rate, presence: { message: '評価もつけてください' }
end
