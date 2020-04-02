class Product < ApplicationRecord
  validates :name, presence: true
  validates :list_price, :sell_price, :stock, numericality: { greater_than: 0 }
end
