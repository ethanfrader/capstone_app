class AddDefaultToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :profile_picture, from: nil, to: "https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png"
  end
end
