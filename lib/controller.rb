require 'csv'
require_relative 'item'
require_relative 'cart'

class Controller
  attr_reader :cart

  def initialize(csv_file)
    @items = []
    @cart = Cart.new
    load_csv(csv_file)
  end

  def list_available_items
    puts 'This is all the items we have available at the moment!'
    puts '---------------'
    @items.each_with_index do |item, index|
      puts "#{index} - [#{item.product_code}] - #{item.name} : #{item.price}$ "
    end
    puts '---------------'
  end

  def add_item_to_cart
    # List all the items available at the store.
    list_available_items

    # Ask the user which item he would like to add to the cart.
    puts 'Please provide us with the index of the item in order to add it to your cart.'
    wished_item = gets.chomp.to_i

    # Find the item with the index provided and add it to the cart.
    if @items[wished_item].nil?
      # If the user provided a wrong index number then provide an error message saying we're unable to find that product.
      puts "We couldn't find the item you're looking for."
    else
      puts '...Beeep...'
      @cart.add_item(@items[wished_item])
      # Provide the user with a success message.
      puts "You're product has been successfully added to your cart!"
    end
  end

  def delete_item_from_cart
    # List all the items available in your cart
    @cart.display_cart
    # Ask the user which item he would like to delete from cart.
    puts 'Please provide us with the number of the item you would like to delete from your cart.'
    delete_item = gets.chomp.to_i
    if @cart.items[delete_item].nil?
      puts "We couldn't find the item you're looking for."
    else
      # Delete the item from the cart
      @cart.delete_item(delete_item)
      # Return the user with his cart
      @cart.display_cart
    end
  end

  def checkout
    if @cart.items.empty?
      puts "Your cart is empty! Are you sure you don't want something from our store?"
    else
    end
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
