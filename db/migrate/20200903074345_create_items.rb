class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.text    :introduction
      t.integer :genre_id, foreign_key: true
      t.integer :itemcondition_id, foreign_key: true
      t.integer :postagepayer_id, foreign_key: true
      t.integer :prefecture_id, foreign_key: true
      t.integer :preparationday_id, foreign_key: true
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
