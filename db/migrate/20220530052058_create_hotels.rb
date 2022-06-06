class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :roomname
      t.string :place
      t.integer :price
      t.string :introduction
      t.string :picture
      t.integer :user_id

      t.timestamps
    end
  end
end
