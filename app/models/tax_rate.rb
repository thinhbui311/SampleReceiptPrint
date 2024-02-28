class TaxRate < ApplicationRecord
  has_many :product_tax_rates
  has_many :products, through: :product_tax_rates
end
