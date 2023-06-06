require 'open-uri'
require 'json'

class Shop < ApplicationRecord
  validates :name, presence: true
  validates :explantory_text, presence: true
  has_one_attached :image
  has_many :taggings
  has_many :tags, through: :taggings

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


  def scrape_website(url)
    agent = Mechanize.new
    page = agent.get(url)

    # インスタグラムのスクレイピング処理
    instagram_data = scrape_instagram('ユーザーID') # ユーザーIDは実際の値に置き換えてください

    # スクレイピング結果を保存する
    self.scraped_data = instagram_data.to_json

    save
  end

  def scrape_instagram(user_id)
    begin
      instagram_source = open("https://www.instagram.com/#{user_id}").read
      content = JSON.parse(instagram_source.split("window._sharedData = ")[1].split(";</script>")[0])
      return content['entry_data']['ProfilePage'][0]['user']
    rescue Exception => e
      return nil
    end
  end
end
