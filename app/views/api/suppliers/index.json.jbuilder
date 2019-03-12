json.array! @suppliers.each do |supplier|
json.partial! "supplier.json.jbuilder", supplier: supplier
end