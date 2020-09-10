class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.text    :introduction
      t.integer :genre_id, foreign_key: true
      t.integer :item_condition_id, foreign_key: true
      t.integer :postage_payer_id, foreign_key: true
      t.integer :prefecture_id, foreign_key: true
      t.integer :preparation_day_id, foreign_key: true
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
