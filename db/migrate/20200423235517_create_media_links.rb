class CreateMediaLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :media_links do |t|
      t.string :url
      t.integer :artist_id

      t.timestamps
    end
  end
end
