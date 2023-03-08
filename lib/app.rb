require_relative 'controller'
require_relative 'router'
require_relative 'cart'
require_relative 'promotion'

csv_file = File.join(__dir__, 'items.csv')
green_tea_promotion = Promotion.new({ title: 'Green Tea Promotion', product_code: 'GR1', type: :buy_x_get_x_free, discount: 0, min_quantity: 1, free_quantity: 1 })
strawberries_promotion = Promotion.new({ title: 'Strawberries Promotion', product_code: 'SR1', type: :price_discount_per_quantity, discount: 4.5, min_quantity: 3 })
coffee_promotion = Promotion.new({ title: 'Coffee Promotion', product_code: 'CF1', type: :percentage_discount_per_quantity, discount: 66.3, min_quantity: 3 })
promotions = [green_tea_promotion, strawberries_promotion, coffee_promotion]
controller = Controller.new(csv_file, promotions)

router = Router.new(controller)

router.run
