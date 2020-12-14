## usersテーブル

| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| nickname                | string     | null: false,                   |
| email                   | string     | null: false, unique: true      |
| encrypted_password      | string     | null: false,                   |
| first_name              | string     | null: false,                   |
| last_name               | string     | null: false,                   |
| first_name_kana         | string     | null: false,                   |
| last_name_kana          | string     | null: false,                   |
| birthday                | date       | null: false,                   |

### Association
- has_many :items
- has_many :histories

## itemsテーブル

| Column           | Type         | Options                        |
| ------           | ----------   | ------------------------------ |
| name             | string       | null: false,                   |
| text             | text         | null: false,                   |
| category_id      | integer      | null: false,                   |
| state_id         | integer      | null: false,                   |
| burden_id        | integer      | null: false,                   |
| area_id          | integer      | null: false,                   |
| shipping_date_id | integer      | null: false,                   |
| price            | integer      | null: false,                   |
| user             | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one: history

## historiesテーブル

| Column         | Type        | Options                        |
| ------         | ----------  | ------------------------------ |
| item           | references  | null: false, foreign_key: true |
| user           | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressテーブル

| Column              | Type         | Options                        |
| ------              | ----------   | --------------------------     |
| postal_code         | string       | null: false,                   |
| area_id             | integer      | null: false,                   |
| city_town           | string       | null: false,                   |
| house_number        | string       | null: false,                   |
| building_number     | string       |                                |
| phone_number        | integer      | null: false,                   |
| history             | references   | null: false, foreign_key: true |



### Association
- belongs_to :history