class CreateMusicLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :music_links do |t|
      t.integer :artist_id
      t.string :url

      t.timestamps
    end
  end
end
