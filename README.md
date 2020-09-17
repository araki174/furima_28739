# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_Confirmation | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| rast_name_kana        | string  | null: false |
| birthday              | date    | null: false |

### Association
- has_many :order
- has_many :items


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_img         | string     |                                |
| name             | string     | null: false                    |
| introduction     | text       | null: false                    |
| genre            | integer    | null: false, foreign_key: true |
| itemcondition    | integer    | null: false, foreign_key: true |
| postagepayer     | integer    | null: false, foreign_key: true |
| prefecture       | integer    | null: false, foreign_key: true |
| preparationday   | integer    | null: false, foreign_key: true |
| price            | integer    | null: false, foreign_key: true |
| user_id          | integer    | null: false, foreign_key: true | 

### Association
- has_one :order
- has_one :address
- belongs_to :user


## address テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| postal_code    | string  | null: false                    |
| prefecture     | integer | null: false                    |
| city           | string  | null: false                    |
| house_number   | string  | null: false                    |
| building_name  | string  |                                |
| phone_number   | integer | null: false                    |
| order_id       | integer | null: false, foreign_key: true |

### Association
- belongs_to :order


## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item