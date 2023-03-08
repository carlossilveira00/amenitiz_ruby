class Cart
  attr_reader :items

  def initialize(promotions)
    @items = []
    @promotions = promotions
  end

  def add_item(item)
    @items << item.dup
  end

  def delete_item(id)
    return puts "Invalid ID provided. Please provide a valid integer." unless id.is_a?(Integer) && id >= 0 && id < @items.length

    @items.delete(@items[id])
  end

  def compute_price
    @promotions.each { |promotion| promotion.apply(@items) } unless @promotions.empty?
    total_price = @items.sum(&:price)
    puts 'Calculating the price.... Beep.... Beep...'
    puts "Your total price is: #{total_price.round(2)}$"
    total_price
  end

  def display_cart
    return puts "Your Cart is empty!" if @items.empty?

    puts 'Your cart:'
    @items.each_with_index do |item, index|
      puts "[#{index}] - #{item.name}: #{item.price}$"
    end
  end
end
