require_relative '../lib/item'
require_relative '../lib/cart'

RSpec.describe Cart do
  let(:item1) { Item.new('Strawberries', 'SR1', 5.00) }
  let(:item2) { Item.new('Green Tea', 'GR1', 3.50) }
  let(:item3) { Item.new('Coffee', 'CF1', 11.23) }
  let(:cart) { Cart.new }

  describe "#initialize" do
    it "creates an empty cart." do
      expect(cart.items).to be_empty
    end
  end



end
