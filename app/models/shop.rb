require 'open-uri'
require 'nokogiri'

class Shop < ApplicationRecord
  def scrape_website(url)
    agent = Mechanize.new
    page = agent.get(url)

    # スクレイピング処理の実装

    # スクレイピング結果を保存する
    self.scraped_data = doc.text

    save
  end
end
