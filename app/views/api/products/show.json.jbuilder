json.partial! "product.json.jbuilder", product: @product

json.supplier do
    json.partial! "/api/suppliers/supplier.json.jbuilder", supplier: @product.supplier
  end