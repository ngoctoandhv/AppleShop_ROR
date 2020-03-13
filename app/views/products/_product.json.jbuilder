json.extract! product, :id, :model, :description, :title, :price, :image, :color, :condition, :created_at, :updated_at
json.url product_url(product, format: :json)
