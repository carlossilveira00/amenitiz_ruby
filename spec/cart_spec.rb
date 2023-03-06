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

      expect(cart.items[0].name).to eq(item1.name)
      expect(cart.items[0].product_code).to eq(item1.product_code)
      expect(cart.items[0].price).to eq(item1.price)
    end

    it "add duplicate items to the cart." do
      cart.add_item(item1)
      cart.add_item(item1)

      expect(cart.items.length).to eq(2)
    end

    it "adds different items to the cart." do
      cart.add_item(item1)
      cart.add_item(item2)

      item_list = [item1, item2]
      cart.items.each_with_index do |item, index|
        expect(item.name).to eq(item_list[index].name)
        expect(item.product_code).to eq(item_list[index].product_code)
        expect(item.price).to eq(item_list[index].price)
      end
    end

    it "creates a new copy of the item when adding it to the cart." do
      cart.add_item(item1)

      expect(cart.items[0].object_id).not_to eq(item1.object_id)
    end
  end

  describe "#delete_item" do
    before do
      cart.add_item(item1)
      cart.add_item(item2)
    end

    it "removes the item with the given id from the cart." do
      cart.delete_item(0)

      expect(cart.items.length).to eq(1)
    end

    it "returns an error message when provided an invalid ID." do
      expect { cart.delete_item('invalid id') }.to output("Invalid ID provided. Please provide a valid integer.\n").to_stdout
    end



  end


end
