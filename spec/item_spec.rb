require_relative '../lib/item'

RSpec.describe Item do
  let(:name) { 'Test Item' }
  let(:product_code) { 'ABC123' }
  let(:price) { 9.99 }
  let(:item) { Item.new(name, product_code, price) }

  describe '#initialize' do
    it 'sets the product name, product_code and price.' do
      expect(item.name).to eq(name)
      expect(item.product_code).to eq(product_code)
      expect(item.price).to eq(price)
    end

    it 'raises an error if the name is not a string.' do
      expect { Item.new(12345, 'ABC123', 9.99) }.to raise_error(ArgumentError)
    end

    it 'raises an error if the product_code is not a string.' do
      expect { Item.new('Test Item', 123, 9.99) }.to raise_error(ArgumentError)
    end

    it 'raises an error if the price is not a float.' do
      expect { Item.new('Test Item', 'ABC123', 10) }.to raise_error(ArgumentError)
    end
  end

  describe "#dup" do
    it "creates a new object with the same attributes." do
      new_item = item.dup

      expect(new_item.object_id).not_to eq(item.object_id)
      expect(new_item.name).to eq(item.name)
      expect(new_item.product_code).to eq(item.product_code)
      expect(new_item.price).to eq(item.price)
    end
  end
end
