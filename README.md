# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_Confirmation | string  | null: false |
| first_name            | string  | null: false |
| rast_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| rast_name_kana        | string  | null: false |
| birthday              | date    | null: false |

### Association
has_many :items
has_one :address
has_one :credit

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_img         | references |                                |
| name             | string     | null: false                    |
| introduction     | text       | null: false                    |
| genre            | string     | null: false, foreign_key: true |
| item_condition   | references | null: false, foreign_key: true |
| postage_payer    | string     | null: false, foreign_key: true |
| prefecture       | string     | null: false, foreign_key: true |
| preparation_day  | integer    | null: false, foreign_key: true |
| price            | integer    | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true | 

### Association
has_one :address
belongs_to :users


<!-- ## credit テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| card_number    | integer    | null: false |
| deadline       | integer    | null: false |
| cvc            | integer    | null: false |

### Association
belongs_to :users -->

## address テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| postal_cade    | integer | null: false                    |
| prefecture     | string  | null: false                    |
| city           | string  | null: false                    |
| house_number   | integer | null: false                    |
| building_name  | string  |                                |
| phone_number   | integer | null: false                    |
| item_id        | integer | null: false, foreign_key: true |

### Association
belongs_to :users
belongs_to :tiems