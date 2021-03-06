require 'pry'
class CashRegister
  attr_accessor :total, :last_transaction
  attr_reader :discount

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    quantity.times {self.items << title}
    self.last_transaction = price * quantity
  end

  def apply_discount
    if discount
      self.total -= ((self.total * (self.discount.to_f/100)))
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
