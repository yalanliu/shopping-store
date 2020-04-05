class Product < ApplicationRecord
  enum status: {on_sale: 0, discontinue: 1, replenish: 2}

  validates :name, presence: true
  validates :list_price, :sell_price, :stock, numericality: { greater_than: 0 }
  validates :sku, presence: true, uniqueness: true

  has_many_attached :images
  belongs_to :user
end
