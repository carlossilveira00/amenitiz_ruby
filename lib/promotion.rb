class Promotion
  def initialize(args)
    @title = args[:title]
    @product_code = args[:product_code]
    @type = args[:type]
    @discount = args[:discount]
  end
end
