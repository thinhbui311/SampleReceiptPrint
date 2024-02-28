class ProductTaxRate < ApplicationRecord
  belongs_to :product
  belongs_to :tax_rate
end
