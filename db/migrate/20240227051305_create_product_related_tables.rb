class CreateProductRelatedTables < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :product_category_id

      t.timestamps
    end

    create_table :tax_rates do |t|
      t.string :category
      t.float :rate

      t.timestamps
    end

    create_table :product_tax_rates do |t|
      t.integer :product_id
      t.integer :tax_rate_id

      t.timestamps
    end

    create_table :orders do |t|
      t.float :total_tax
      t.float :total_price

      t.timestamps
    end

    create_table :line_items do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.float :unit_price
      t.float :sub_total
      t.float :total_tax
      t.float :total_price

      t.timestamps
    end
  end
end
