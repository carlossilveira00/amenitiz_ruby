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

  end

end
