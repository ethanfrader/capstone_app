class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :bio
      t.string :location
      t.string :members
      t.string :genre
      t.string :email

      t.timestamps
    end
  end
end
