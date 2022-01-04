class Item < ApplicationRecord
  belongs_to :receipt

  def total_price
    qty.to_i * cost.to_f
  end
end
