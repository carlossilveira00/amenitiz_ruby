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

  describe "#add_item" do
    it "add an item to the cart." do
      cart.add_item(item1)

      expect(cart.items).to include(item1)
    end

    it "add duplicate items to the cart." do
      cart.add_item(item1)
      cart.add_item(item1)

      expect(cart.items.length).to eq(2)
    end

    it "adds different items to the cart." do
      cart.add_item(item1)
      cart.add_item(item2)

      expect(cart.items.length).to eq(2)
      expect(cart.items).to include(item1, item2)
    end

    it "creates a new copy of the item when adding it to the cart." do
      cart.add_item(item1)

      expect(cart.items[0].object_id).not_to eq(item1.object_id)
    end



  end

end
