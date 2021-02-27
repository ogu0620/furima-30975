## users テーブル

|  Column          | Type      | Options     |
| ---------------- | --------- | ----------- |
|nickname          |string     | null: false |
|password          |string     | null: false |
|first_name        |string     | null: false |
|last_name         |string     | null: false |
|first_name_kana   |string     | null: false |
|last_name_kana    |string     | null: false |
|email             |string     | null: false |
|year_of_birth     |integer    | null: false |
|birth_month       |integer    | null: false |
|birth_day         |integer    | null: false |



## items テーブル

|  Column          | Type     | Options                       |
| ---------------- | -------- | ----------------------------- |
|image             |references| null: false                   |
|product_name      |string    | null: false                   |
|description       |text      | null: false                   |
|category          |string    | null: false                   |
|states            |string    | null: false                   |
|delivery_fee      |integer   | null: false                   |
|shipping_area     |string    | null: false                   |
|shipping_days     |datetime  | null: false                   |
|price             |integer   | null: false                   |
|seller            |references| null: false ,foreign_key: true|



## purchase_records テーブル

|  Column          | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
|buyer             |references   | null: false , foreign_key: true|
|purchased_item    |references   | null: false , foreign_key: true|



## addresses テーブル

|  Column          | Type   | Options     |
| ---------------- | ------ | ----------- |
|prefectures       |string  | null: false |
|municipality      |string  | null: false |
|house_number      |string  | null: false |
|building_name     |string  | null: false |
|phone_number      |integer | null: false |
