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

  def compute_price
    total_price = @items.sum(&:price)
    puts "Calculating the price.... Beep.... Beep..."
    puts "Your total price is: #{total_price.round(2)}$"
    total_price
  end
end
