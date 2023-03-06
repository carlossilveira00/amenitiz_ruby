class Item
  attr_reader :name, :product_code, :price

  def initialize(name, product_code, price)
    check_string_arguments(name, "Name")
    check_string_arguments(product_code, "Product Code")
    check_float_arguments(price, "Price")

    @name = name
    @product_code = product_code
    @price = price
  end

  def dup
    Item.new(@name, @product_code, @price)
  end

  private

  def check_string_arguments(arg, arg_name)
    raise ArgumentError.new("#{arg_name} must be a string!") unless arg.is_a?(String)
  end

  def check_float_arguments(arg, arg_name)
    raise ArgumentError.new("#{arg_name} must be a float!") unless arg.is_a?(Float)
  end
end
