require_relative '../lib/controller'

RSpec.describe Controller do
  let(:csv_file) { File.join(__dir__, '../lib/items.csv')  }
  let(:controller) { Controller.new(csv_file) }
  let(:item1) { Item.new('Green Tea', 'GR1', 3.50) }
  let(:item2) { Item.new('Strawberries', 'SR1', 5.00) }
  let(:item3) { Item.new('Coffee', 'CF1', 11.23) }

  describe "#initialize" do
    context "when creating a new controller" do
      it "sets items instance variable" do
        expect(controller.instance_variable_get(:@items)).not_to be_nil
      end

      it "sets items instance variable" do
        expect(controller.instance_variable_get(:@cart)).not_to be_nil
      end

      it "loads the items from the csv." do
        expect(controller.instance_variable_get(:@items)).not_to be_empty
      end
    end
  end

  describe "#add_item_to_cart" do
    before do
      allow(controller).to receive(:gets).and_return("#{item_index}\n")
    end

    context 'when the input is valid' do
      let(:item_index) { 0 }

      it 'adds the item to the cart' do
        controller.add_item_to_cart

        expect(controller.cart.items).to include(an_instance_of(Item))
      end
    end

    context "when the input is invalid" do
      let(:item_index) { 10 }

      it 'does not add the item to the cart' do
        controller.add_item_to_cart

        expect(controller.cart.items).to be_empty
      end
    end
  end

  describe "#delete_item_from_cart" do
    before do
      allow(controller).to receive(:gets).and_return("#{item_index}\n")
      controller.add_item_to_cart
      controller.add_item_to_cart
    end

    context 'when the input is valid' do
      let(:item_index) { 0 }

      it 'deletes the item from the cart' do
        controller.delete_item_from_cart

        expect(controller.cart.items.length).to eq(1)
      end
    end

    context 'when the input is invalid' do
      let(:item_index) { -1 }

      it 'keeps the cart unchanged' do
        controller.delete_item_from_cart

        expect(controller.cart.items.length).to eq(2)
      end
    end
  end

  describe "#checkout" do
    context "when there are no items in the cart" do
      it "displays a message to the user stating that the cart is empty" do
        expect { controller.checkout }.to output("Your cart is empty! Are you sure you don't want something from our store?\n").to_stdout
      end
    end

    context "when there are items in the cart but no promotions" do
      before do
        controller.cart.add_item(item1)
        controller.cart.add_item(item2)
        controller.cart.add_item(item3)
      end

      it "displays the list of products in the cart" do
        expect { controller.checkout }.to output(/Your cart:/).to_stdout
      end

      it "displays the price to the user." do
        expect { controller.checkout }.to output(/Your total price is:/).to_stdout
      end
    end
  end
end
