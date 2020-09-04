class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_img
      t.string  :name
      t.text    :introduction
      t.integer :genre
      t.integer :itemcondition
      t.integer :postage_payer
      t.integer :prefecture
      t.integer :preparation_day
      t.integer :price
      t.integer :user_id
      t.timestamps
    end
  end
end
