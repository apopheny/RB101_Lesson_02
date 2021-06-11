# Build a command line calculator program that does the following:

#     asks for two numbers
#     asks for the type of operation to perform: add, subtract, multiply or divide
#     displays the result

puts ">> This is a basic calculator"
puts ">> Enter your first number:"
first_number = gets.to_i
loop do
  if first_number == nil 
    puts ">> Please enter a number:"
    first_number = gets.to_i
  else
    break
  end
end 
  
puts ">> Enter your second number?:"
second_number = gets.to_i
loop do
  if second_number == nil 
    puts ">> Please enter a number:"
    second_number = gets.to_i
  else
    break
  end
end 


def calculate(num_1, num_2)
  puts ">> Would you like to add, subtract, multiply, or divide?"
  puts ">> Type 'add', 'subtract', 'multiply', or 'divide':"
  operation = gets.chomp.downcase
  if operation == 'add'
    puts num_1 + num_2
  elsif
    operation == 'subtract'
    puts  num_1 - num_2
  elsif
    operation == 'multiply'
    puts num_1 * num_2
  elsif
    operation == 'divide'
    puts num_1 / num_2
  else
    loop do
      puts "You did not enter a valid operation."
      puts "Please type 'add', 'subtract', 'multiply', or 'divide':"
      operation = gets.chomp.downcase
      if operation == 'add'
        puts num_1 + num_2
        break
      elsif
        operation == 'subtract'
        puts  num_1 - num_2
        break
      elsif
        operation == 'multiply'
        puts num_1 * num_2
        break
      elsif
        operation == 'divide'
        puts num_1 / num_2
        break
      end
    end
  end
end

calculate(first_number, second_number)