require_relative 'controller'
require_relative 'router'
require_relative 'cart'
require_relative 'promotion'

csv_file = File.join(__dir__, 'items.csv')
promotions = [Promotion.new( { title: 'Strawberries Promotion', product_code: 'SR1', type: :price_discount_per_quantity, discount: 4.5 } ), Promotion.new({title: 'Coffee Promotion', product_code: 'CF1', type: :percentage_discount_per_quantity, discount: 66.3}), Promotion.new({title: 'Green Tea Promotion', product_code: 'GR1', type: :buy_one_get_one_free, discount: 0})]
controller = Controller.new(csv_file, promotions)

router = Router.new(controller)

router.run
