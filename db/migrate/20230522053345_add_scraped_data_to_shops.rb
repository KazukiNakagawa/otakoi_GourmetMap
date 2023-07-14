class AddScrapedDataToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :scraped_data, :text
  end
end
