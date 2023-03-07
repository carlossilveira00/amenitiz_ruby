require_relative '../lib/controller'

RSpec.describe Controller do
  let(:csv_file) { File.join(__dir__, '../lib/items.csv')  }
  let(:controller) { Controller.new(csv_file) }

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



end
