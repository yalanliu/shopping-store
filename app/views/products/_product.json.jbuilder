json.extract! product, :id, :name, :description, :sku, :list_price, :sell_price, :stock, :status, :created_at, :updated_at
json.url product_url(product, format: :json)
