class Promotion
  def initialize(args)
    @title = args[:title]
    @product_code = args[:product_code]
    @type = args[:type]
    @discount = args[:discount]
  end

  def apply(cart)
    case @type
    when :buy_one_get_one_free
      buy_one_get_one_free(cart)
    when :price_discount_per_quantity
      price_discount_per_quantity(cart)
    end
  end

  private

  def buy_one_get_one_free(cart_items)
    matching_items = cart_items.select { |item| item.product_code == @product_code }

    matching_items.each do |item|
      new_item = item.dup
      new_item.price = 0
      cart_items << new_item
    end
  end

  def price_discount_per_quantity(cart_items)
    matching_items = cart_items.select { |item| item.product_code == @product_code }

    matching_items.each { |item| item.price = @discount } if matching_items.length >= 3
  end

end
