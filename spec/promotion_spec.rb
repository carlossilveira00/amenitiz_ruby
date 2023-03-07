require_relative '../lib/item'
require_relative '../lib/cart'
require_relative '../lib/promotion'

RSpec.describe Promotion do
  let(:buy_one_get_one_free_promotion) { Promotion.new({ title:'Grean Tea - Buy one and get one free!', product_code: "GR1", type: :buy_one_get_one_free, discount: 100 }) }
  let(:item1) { Item.new('Green Tea', 'GR1', 3.50) }
  let(:item2) { Item.new('Strawberries', 'SR1', 5.00) }
  let(:item3) { Item.new('Coffee', 'CF1', 11.23) }
  let(:cart) { Cart.new }

  describe "#initialize" do
    context "when creating a new Promotion" do
      it "sets the promotion title" do
        expect(buy_one_get_one_free_promotion.instance_variable_get(:@title)).to eq('Grean Tea - Buy one and get one free!')
      end

      it "sets the promotion product_code" do
        expect(buy_one_get_one_free_promotion.instance_variable_get(:@product_code)).to eq("GR1")
      end

      it "sets the promotion type" do
        expect(buy_one_get_one_free_promotion.instance_variable_get(:@type)).to eq(:buy_one_get_one_free)
      end

      it "sets the promotion discount" do
        expect(buy_one_get_one_free_promotion.instance_variable_get(:@discount)).to eq(100)
      end
    end
  end

  describe "#apply" do
    context "when promotion type is :buy_one_get_one_free" do
      it "adds an item to the cart but with the price set to 0" do
        cart.add_item(item1)
        buy_one_get_one_free_promotion.apply(cart.items)

        expect(cart.items.length).to eq(2)
        expect(cart.items[1].price).to eq(0)
      end

      it "applies the promotion to the items with the correct product_code" do
        cart.add_item(item1)
        cart.add_item(item1)
        cart.add_item(item2)
        cart.add_item(item3)

        buy_one_get_one_free_promotion.apply(cart.items)

        expect(cart.items[2].price).to eq(5.00)
        expect(cart.items[3].price).to eq(11.23)
        expect(cart.items[4].price).to eq(0)
      end

    end
  end




end