require_relative '../lib/item'
require_relative '../lib/cart'
require_relative '../lib/promotion'

RSpec.describe Promotion do
  let(:green_tea_promotion) { Promotion.new({ title:'Grean Tea - Buy one and get one free!', product_code: "GR1", type: :buy_one_get_one_free, discount: 100 }) }

  describe "#initialize" do
    context "when creating a new Promotion" do
      it "sets the promotion title" do
        expect(green_tea_promotion.instance_variable_get(:@title)).to eq('Grean Tea - Buy one and get one free!')
      end

      it "sets the promotion product_code" do
        expect(green_tea_promotion.instance_variable_get(:@product_code)).to eq("GR1")
      end

      it "sets the promotion type" do
        expect(green_tea_promotion.instance_variable_get(:@type)).to eq(:buy_one_get_one_free)
      end

      it "sets the promotion discount" do
        expect(green_tea_promotion.instance_variable_get(:@discount)).to eq(100)
      end
    end
  end



end
