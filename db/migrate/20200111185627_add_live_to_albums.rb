class AddLiveToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :live, :boolean, defaults: false
  end
end
