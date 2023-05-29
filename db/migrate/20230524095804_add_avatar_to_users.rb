class AddAvatarToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatar, :string
    add_column :users, :avatar_cache, :string
    add_column :users, :remove_avatar, :boolean, default: false
  end
end
