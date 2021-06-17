# m = p * (j / (1 - (1 + j)**(-n)))

#     m = monthly payment
#     p = loan amount
#     j = monthly interest rate
#     n = loan duration in months

def monthly_interest_rate(apr)
  apr / 12
end

def fraction_to_percentage(fraction)
  fraction * 100
end

def monthly_payment(total_amount, monthly_rate, loan_duration)
  total_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_duration)))
end

# method to add trailing zeros to monthly payment amount
def round(monthly_payment)
  rounded = monthly_payment.round(2).to_s
  monthly_payment_array = rounded.split(//)
  if monthly_payment_array[-2] == "."
    rounded += "0"
  else
    rounded.to_f
  end
end

# method for output of monthly interest rate
def monthly_print(loan_apr)
  round = (loan_apr * 100).round(3)
  p round
end

# begin loop
loop do
  # statement and get inputs
  puts ">> Welcome to your mortgage calculator!"
  puts ">> Please enter your loan amount:"
  total_amount = gets.chomp.to_f

  # user will input a whole number here, which should be divided by 100
  puts ">> Please enter your APR:"
  loan_apr = gets.chomp.to_f / 100

  puts ">> Please enter your loan duration in months:"
  loan_duration = gets.chomp.to_i

  # store monthly interest rate for calculation
  monthly_interest_rate = monthly_interest_rate(loan_apr)

  monthly_payment = monthly_payment(total_amount, monthly_interest_rate, loan_duration)

  monthly = round(monthly_payment)

  total_payment = monthly.to_f * loan_duration

  puts ">> Your monthly interest rate would be #{monthly_print(monthly_interest_rate)}%"

  puts ">> Your monthly payment over #{loan_duration} months would be $#{monthly}"

  puts ">> If payed on schedule, you will pay $#{round(total_payment)}"

  puts ">> Would you like to perform another calculation? (Y/N):"
  again = gets.chomp
  break if again.downcase == "n"
end
