class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_days
  belongs_to :status

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description, presence: true

  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }

  validates :category_id, :delivery_fee_id, :prefecture_id, :shipping_days_id, :status_id, numericality: { other_than: 1 }
end
