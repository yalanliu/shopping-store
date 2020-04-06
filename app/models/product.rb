class Product < ApplicationRecord
  enum status: {on_sell: 0, discontinue: 1, replenish: 2}
  # validations
  validates :name, presence: true
  validates :list_price, :sell_price, :stock, numericality: { greater_than: 0 }
  validates :sell_price, numericality: { less_than_or_equal_to: :list_price }
  validates :sku, presence: true, uniqueness: true
  # relationship
  has_many_attached :images
  belongs_to :user
  # scope
  scope :available, -> { where.not(status: 1).order(id: :desc) }
end
