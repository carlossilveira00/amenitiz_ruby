require_relative '../lib/controller'

RSpec.describe Controller do
  let(:csv_file) { File.join(__dir__, '../lib/items.csv')  }
  let(:controller) { Controller.new(csv_file) }

  describe "#initialize" do
    context "when creating a new controller" do
      it "sets items instance variable" do
        expect(controller.instance_variable_get(:@items)).not_to be_nil
      end

      it "loads the items from the csv." do
        expect(controller.instance_variable_get(:@items)).not_to be_empty
      end

    end
  end


end
