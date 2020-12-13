## usersテーブル

| Column                  | Type       | Options                        |
| ------                  | ---------- | ------------------------------ |
| nickname                | string     | null: false,                   |
| email                   | string     | null: false,                   |
| password                | string     | null: false,                   |
| confirmation_password   | string     | null: false,                   |
| first_name              | string     | null: false,                   |
| last_name               | string     | null: false,                   |
| first_name_kana         | string     | null: false,                   |
| last_name_kana          | string     | null: false,                   |
| birthday                | date       | null: false,                   |


### Association
- has_many :items
- has_many :cards

## itemsテーブル

| Column           | Type         | Options                        |
| ------           | ----------   | ------------------------------ |
| image            | string       | null: false,                   |
| name             | string       | null: false,                   |
| text             | text         | null: false,                   |
| category         | string       | null: false,                   |
| state            | string       | null: false,                   |
| burden           | string       | null: false,                   |
| area             | string       | null: false,                   |
| shipping_date    | string       | null: false,                   |
| price            | integer      | null: false,                   |
| user             | references   | null: false, foreign_key: true |

### Association
- belongs_to :user

## cardsテーブル

| Column         | Type        | Options                        |
| ------         | ----------  | ------------------------------ |
| number         | integer     | null: false                    |
| date           | integer     | null: false                    |
| security_code  | integer     | null: false                    |
| user           | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address

## addressテーブル

| Column              | Type         | Options                   |
| ------              | ----------   | --------------------------|
| postal_code         | string       | null: false,              |
| prefecture          | string       | null: false,              |
| city_town           | string       | null: false,              |
| house_number        | string       | null: false,              |
| building_number     | string       | null: false,              |
| phone_number        | integer      | null: false,              |

### Association
- belongs_to :card