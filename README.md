## users テーブル

|  Column          | Type      | Options                 |
| ---------------- | --------- | ----------------------- |
|nickname          |string     | null: false             |
|encrypted_password|string     | null: false             |
|first_name        |string     | null: false             |
|last_name         |string     | null: false             |
|first_name_kana   |string     | null: false             |
|last_name_kana    |string     | null: false             |
|email             |string     | null: false,unique:true |
|birthday          |date       | null: false             |


### Association

- has_many :items
- has_many :purchase_records



## items テーブル

|  Column          | Type     | Options                       |
| ---------------- | -------- | ----------------------------- |
|product_name      |string    | null: false                   |
|description       |text      | null: false                   |
|category_id       |integer   | null: false                   |
|status_id         |integer   | null: false                   |
|delivery_fee_id   |integer   | null: false                   |
|prefecture_id     |integer   | null: false                   |
|shipping_days_id  |integer   | null: false                   |
|price             |integer   | null: false                   |
|user              |references| null: false ,foreign_key: true|

### Association

- belongs_to :users
- has_one :purchase_records

## purchase_records テーブル

|  Column          | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
|user              |references   | null: false , foreign_key: true|
|item              |references   | null: false , foreign_key: true|


### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses



## addresses テーブル

|  Column          | Type   | Options     |
| ---------------- | ------ | ----------- |
|prefecture_id     |integer | null: false |
|municipality      |string  | null: false |
|house_number      |string  | null: false |
|building_name     |string  |             |
|phone_number      |string  | null: false |
|postal_code       |string  | null: false |


### Association

- belongs_to :purchase_records