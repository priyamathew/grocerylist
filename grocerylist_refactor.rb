class Grocery_list

  def initialize
    @list = {}
    @bought = {}
  end

  def add_to_list(item)
    if @list.has_key?(item)
      @list[item] += 1
    else
      @list[item] = 1
    end
      @list
  end

  def cross_off_list(item)
    if @list.has_key?(item) && @list[item] > 1
      @list[item] -= 1
      @bought[item] = 1
    elsif 
      @list.delete(item)
      @bought[item] = 1
    else
      puts "This item was not in the list. Do you want to add it to bought items?"
      puts "Please answer y or n."
      answer = gets.chomp
      if answer.downcase == 'y'
        @bought[item] = 1
      end
    end
  end

  def check_list
    puts "Here's your grocery list: #{@list}."
    puts "Here's what you've bought: #{@bought}."
  end

  def save_list
    puts "What do you want to call the list?"
    filename = gets.chomp + ".txt"
    File.open filename, 'w' do |f|
      f.write "Here's your grocery list: #{@list}. \nHere's what you've bought: #{@bought}." 
    end
    puts "Your list has been saved as #{filename}"
  end
end

list = Grocery_list.new

while true
  puts "What do you want to do? Add item, Remove item, Check list, Save list, Exit"
  option = gets.chomp
  if option == "Add item"
    puts "What do you want to buy? Please enter an item."
    item = gets.chomp
    list.add_to_list(item)
  elsif option == "Remove item"
    puts "What did you buy? Please enter an item."
    item = gets.chomp
    list.cross_off_list(item)
  elsif option == "Check list"
    list.check_list
  elsif option == "Save list"
    list.save_list
  elsif option == "exit"
    break
  else
    puts "Huh? Please type in one of the options."
  end
end

# glist1 = Grocery_list.new
# glist1.add_to_list("Bananas") 
# glist1.add_to_list("Bananas")
# glist1.add_to_list("Mangos")
# glist1.add_to_list("Grapes")
# glist1.add_to_list("Grapes")
# glist1.cross_off_list("Grapes")
# glist1.check_list