require_relative '../lib/router'

RSpec.describe Router do
  let(:buy_one_get_one_free_promotion) { Promotion.new({ title:'Grean Tea - Buy one and get one free!', product_code: "GR1", type: :buy_one_get_one_free, discount: 100 }) }
  let(:price_discount_per_quantity_promotion) { Promotion.new({ title:'Strawberries - Buy 3 or more and get price reduction to 4.50$!', product_code: "SR1", type: :price_discount_per_quantity, discount: 4.50 }) }
  let(:percentage_discount_per_quantity_promotion) { Promotion.new({ title:'Coffee - Buy 3 or more and get price reduction 2/3 of the price!', product_code: "CF1", type: :percentage_discount_per_quantity, discount: 66.6 }) }
  let(:promotions) { [buy_one_get_one_free_promotion, price_discount_per_quantity_promotion, percentage_discount_per_quantity_promotion] }
  let(:csv_file) { File.join(__dir__, '../lib/items.csv')  }
  let(:controller) { Controller.new(csv_file, promotions) }
  let(:router) { Router.new(controller) }

  describe "#initialize" do
    context "when creating a new router" do
      it "sets controller instance variable" do
        expect(router.instance_variable_get(:@controller)).not_to be_nil
      end

      it "sets cart running variable" do
        expect(router.instance_variable_get(:@running)).not_to be_nil
      end
    end
  end

end
