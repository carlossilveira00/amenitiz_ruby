class Promotion
  def initialize(args)
    @title = args[:title]
    @product_code = args[:product_code]
    @type = args[:type]
    @discount = args[:discount]
    @min_quantity = args[:min_quantity]
    @free_quantity = args[:free_quantity]
  end

  def apply(cart)
    case @type
    when :buy_x_get_x_free
      buy_x_get_x_free(cart)
    when :price_discount_per_quantity
      price_discount_per_quantity(cart)
    when :percentage_discount_per_quantity
      percentage_discount_per_quantity(cart)
    end
  end

  private

  def buy_x_get_x_free(cart_items)
    matching_items = cart_items.select { |item| item.product_code == @product_code }

    matching_items.each_slice(@min_quantity) do |slice|
      next unless slice.size >= @min_quantity

      free_item = slice[0]
      @free_quantity.times do
        new_item = free_item.dup
        new_item.price = 0
        cart_items << new_item
      end
    end
  end

  def price_discount_per_quantity(cart_items)
    matching_items = cart_items.select { |item| item.product_code == @product_code }

    matching_items.each { |item| item.price = @discount } if matching_items.length >= @min_quantity
  end

  def percentage_discount_per_quantity(cart_items)
    matching_items = cart_items.select { |item| item.product_code == @product_code }

    matching_items.each do |item|
      item.price *= (100.0 - @discount) / 100.0 if matching_items.length >= @min_quantity
      item.price = item.price.round(2)
    end
  end

end
