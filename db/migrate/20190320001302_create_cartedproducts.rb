class CreateCartedproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cartedproducts do |t|
      t.string :status
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.integer :order_id

      t.timestamps
    end
  end
end
