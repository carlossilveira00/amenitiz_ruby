class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item.dup
  end

  def delete_item(id)
    return puts "Invalid ID provided. Please provide a valid integer." unless id.is_a?(Integer) && id >= 0 && id < @items.length

    @items.delete(@items[id])
  end
end
