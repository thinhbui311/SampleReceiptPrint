class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def recalculate_price!
    ActiveRecord::Base.transaction do
      line_items.each(&:recalculate_price!)
      self.total_tax = line_items.to_a.sum(&:total_tax)
      self.total_price = line_items.to_a.sum(&:total_price)
      self.save!
    end
  end
end
