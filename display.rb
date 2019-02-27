require 'http'
require 'tty-table'

response = HTTP.get("http://localhost:3000/api/")

info = response.parse

table = TTY::Table.new ['id', 'name', 'price', 'image_url', 'description']