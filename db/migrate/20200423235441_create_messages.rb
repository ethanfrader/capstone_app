class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :artist_id
      t.string :text
      t.integer :recipient_id

      t.timestamps
    end
  end
end
