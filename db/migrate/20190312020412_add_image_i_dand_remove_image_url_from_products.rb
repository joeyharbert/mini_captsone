class AddImageIDandRemoveImageUrlFromProducts < ActiveRecord::Migration[5.2]
  def change
    #not adding a column adding a method internally silly me

    remove_column :products, :image_url, :string 
  end
end
