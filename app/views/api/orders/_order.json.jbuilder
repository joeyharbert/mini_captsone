json.id order.id
#json.products order.products
#json.quantities order.quantities
#json.carted_products order.cartedproducts
json.carted_products do 
  json.array! order.cartedproducts do |cartedproduct|
    json.product cartedproduct.product
    json.quantity cartedproduct.quantity
  end
end
json.subtotal order.subtotal
json.tax order.tax
json.total order.total