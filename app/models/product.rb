class Product < ApplicationRecord
  enum status: {on_sell: 0, discontinue: 1, replenish: 2}
  # validations
  validates :name, presence: true
  validates :list_price, :sell_price, :stock, numericality: { greater_than: 0 }
  validates :sell_price, numericality: { less_than_or_equal_to: :list_price }
  validates :sku, presence: true, uniqueness: true, format: { with: /\p{Upper}{3}\d{3}/,
  message: "格式應為-大寫英文三碼 + 數字三碼(例如: AEC001)" }
  # relationship
  has_many_attached :images
  belongs_to :user
  # scope
  scope :available, -> { where.not(status: 1).order(id: :desc) }
end
