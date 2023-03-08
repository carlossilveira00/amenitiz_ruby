require_relative '../lib/item'
require_relative '../lib/cart'
require_relative '../lib/promotion'

RSpec.describe Promotion do
  let(:buy_one_get_one_free_promotion) { Promotion.new({ title:'Grean Tea - Buy one and get one free!', product_code: "GR1", type: :buy_one_get_one_free, discount: 100, min_quantity: 1, free_quantity: 1 }) }
  let(:price_discount_per_quantity_promotion) { Promotion.new({ title:'Strawberries - Buy 3 or more and get price reduction to 4.50$!', product_code: "SR1", type: :price_discount_per_quantity, discount: 4.50 }) }
  let(:percentage_discount_per_quantity_promotion) { Promotion.new({ title:'Coffee - Buy 3 or more and get price reduction 2/3 of the price!', product_code: "CF1", type: :percentage_discount_per_quantity, discount: 66.6 }) }
  let(:promotions) { [buy_one_get_one_free_promotion, price_discount_per_quantity_promotion, percentage_discount_per_quantity_promotion] }
  let(:item1) { Item.new('Green Tea', 'GR1', 3.50) }
  let(:item2) { Item.new('Strawberries', 'SR1', 5.00) }
  let(:item3) { Item.new('Coffee', 'CF1', 11.23) }
  let(:cart) { Cart.new(promotions) }

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

      it "sets the minimum quantity" do
        expect(buy_one_get_one_free_promotion.instance_variable_get(:@min_quantity)).to eq(1)
      end

      it "sets the free quantity" do
        expect(buy_one_get_one_free_promotion.instance_variable_get(:@free_quantity)).to eq(1)
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

    context "when promotion type is :price_discount_per_quantity" do
      it "applies price discount for items with the correct product_code" do
        cart.add_item(item2)
        cart.add_item(item1)
        cart.add_item(item2)
        cart.add_item(item2)
        price_discount_per_quantity_promotion.apply(cart.items)

        expect(cart.items[0].price).to eq(4.50)
        expect(cart.items[1].price).to eq(3.50)
        expect(cart.items[2].price).to eq(4.50)
        expect(cart.items[3].price).to eq(4.50)
      end

      it "does not apply promotion if quantity is bellow 3" do
        cart.add_item(item2)
        cart.add_item(item2)

        expect(cart.items[0].price).to eq(5.00)
        expect(cart.items[1].price).to eq(5.00)
      end
    end

    context "when promotion type is :percentage_discount_per_quantity" do
      it "applies percentage discount for items with the correct product_code" do
        cart.add_item(item3)
        cart.add_item(item2)
        cart.add_item(item3)
        cart.add_item(item3)
        percentage_discount_per_quantity_promotion.apply(cart.items)

        expect(cart.items[0].price).to eq(3.75)
        expect(cart.items[1].price).to eq(5.00)
        expect(cart.items[2].price).to eq(3.75)
        expect(cart.items[3].price).to eq(3.75)
      end

      it "does not apply promotion if quantity is bellow 3" do
        cart.add_item(item3)
        cart.add_item(item3)

        expect(cart.items[0].price).to eq(11.23)
        expect(cart.items[1].price).to eq(11.23)
      end
    end
  end
end
