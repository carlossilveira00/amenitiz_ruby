class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts 'Welcome to Amenitiz Store!'
    puts "           --           "

    while @running
      display_user_actions
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def display_user_actions
    puts ''
    puts "What would you like to do next?"
    puts '1- Display available items.'
    puts "-----------"
    puts '2- Display promotions.'
    puts "-----------"
    puts '3- Add item to cart.'
    puts "-----------"
    puts '4- Delete item from cart.'
    puts "-----------"
    puts '5- Check cart and checkout.'
    puts "-----------"
    puts '6- Exit store.'
    puts "-----------"
  end

  def route_action(action)
    case action
      when 1 then @controller.list_available_items
      when 2 then @controller.display_promotions
      when 3 then @controller.add_item_to_cart
      when 4 then @controller.delete_item_from_cart
      when 5 then @controller.checkout
      when 6 then stop
    end
  end

  def stop
    puts "What a pleasure to meet you! Hope you come back! :)"
    @running = false
  end

end
