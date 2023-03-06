class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item.dup
  end
end
