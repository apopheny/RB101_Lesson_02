VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def one_letter(user_entry)
  if user_entry.start_with?("r")
    VALID_CHOICES[0]
  elsif user_entry.start_with?("p")
    VALID_CHOICES[1]
  elsif user_entry.start_with?("s")
    prompt("Please enter 'sc' for 'scissors' or 'sc' for 'spock'")
    clarification = gets.chomp.downcase
    if clarification == "sc"
      VALID_CHOICES[2]
    elsif clarification == "sp"
      VALID_CHOICES[4]
    end
  elsif user_entry.start_with?("l")
    VALID_CHOICES[3]
  end
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
  (first == "rock" && second == "lizard") ||
  (first == "scissors" && second == "paper") ||
  (first == "scissors" && second == "lizard") ||
  (first == "paper" && second == "rock") ||
  (first == "paper" && second == "spock") ||
  (first == "spock" && second == "rock") ||
  (first == "spock" && second == "scissors") ||
  (first == "lizard" && second == "spock") ||
  (first == "lizard" && second == "paper")
end

def display_result(player, computer)
  if    win?(player, computer)
    prompt("You won!")
    prompt("First to three wins!")
  elsif win?(computer, player)
    prompt("The computer won!")
    prompt("First to three wins!")
  else
    prompt("It's a tie!")
  end
end

choice = nil
playerscore = 0
computerscore = 0

loop do

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase()

    choice = one_letter(choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  if win?(choice, computer_choice)
    playerscore += 1
  elsif win?(computer_choice, choice)
    computerscore += 1
  end

  prompt("Player: #{playerscore}")
  prompt("Computer: #{computerscore}")

  if playerscore == 3
    prompt("Game, set, match! You win!")
    break
  elsif computerscore == 3
    prompt("DUN DUN DUN! The computer won the match!")
    break
  end

  prompt("Would you like to play again? (y/n)")
  response = Kernel.gets().chomp().downcase()
  break unless response.downcase().start_with?('y')
end

prompt("Thank you for playing! Goodbye!")
