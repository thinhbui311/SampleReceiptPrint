class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  delegate :name, to: :product, prefix: true

  class << self
    def csv_headers
      %w(Quantity Product Price)
    end

    def csv_attributes
      %w(quantity product_name total_price)
    end
  end

  def recalculate_price!
    self.sub_total = (unit_price * quantity)
    self.total_tax = ItemTaxCalculator.new(self).calculate.to_f.round_to_nearest_005
    self.total_price = (sub_total + total_tax).round(2)
    self.save!
  end
end
