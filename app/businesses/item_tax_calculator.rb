class ItemTaxCalculator
  attr_accessor :line_item

  def initialize line_item
    @line_item = line_item
  end

  def calculate
    sub_total = line_item.quantity * line_item.unit_price

    line_item.product.tax_rates.reduce(0) do |total_tax, tax_rate|
      total_tax + sub_total * tax_rate.rate
    end
  end
end
