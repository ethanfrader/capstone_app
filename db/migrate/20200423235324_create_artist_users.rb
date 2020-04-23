class CreateArtistUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_users do |t|
      t.integer :user_id
      t.integer :artist_id
      t.string :privileges

      t.timestamps
    end
  end
end
