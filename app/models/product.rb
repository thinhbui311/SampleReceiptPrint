class Product < ApplicationRecord
  has_many :line_items
  has_many :product_tax_rates
  has_many :tax_rates, through: :product_tax_rates
end
