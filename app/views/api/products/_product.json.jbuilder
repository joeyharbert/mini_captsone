json.id product.id
json.name product.name
json.description product.description
json.images product.images


# json.pricing_info do
  json.discounted product.is_discounted?
  json.price product.price
  json.tax product.tax
  json.total product.total  
  json.visual_total product.total_string
# end

json.categories product.categories