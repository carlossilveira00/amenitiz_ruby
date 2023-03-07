require 'csv'
require_relative 'item'

class Controller
  def initialize(csv_file)
    @items = []
    load_csv(csv_file)
  end

  private

  def load_csv(csv_file)
    CSV.foreach(csv_file) do |row|
      if row.length != 3 || row.any? { |cell| cell.empty? }
        raise StandardError, "Invalid CSV file."
      end
      @items << Item.new(row[0], row[1], row[2].to_f)
    end
  end
end
