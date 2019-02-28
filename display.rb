require 'http'
require 'tty-table'

response = HTTP.get("http://localhost:3000/api/")

info = response.parse

table = TTY::Table.new header: ['id', 'name', 'price', 'description', 
'image_url']

info.each do |item|
  array = item.values
  table << array
end

puts table.render