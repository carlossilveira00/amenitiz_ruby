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

end
