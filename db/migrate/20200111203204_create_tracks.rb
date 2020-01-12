class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :ord
      t.string :lyrics
      t.boolean :regular, defaults: true
      t.integer :album_id, null: false

      t.timestamps
    end
  end
end
