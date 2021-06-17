# Take everything you've learned so far and build a mortgage calculator (or car payment calculator -- it's the same thing).

# You'll need three pieces of information:

#     the loan amount
#     the Annual Percentage Rate (APR)
#     the loan duration

# From the above, you'll need to calculate the following things:

#     monthly interest rate
#     loan duration in months
#     monthly payment

# You can use the following formula:

# Mortgage Calculator Formula

# m = p * (j / (1 - (1 + j)**(-n)))

#     m = monthly payment
#     p = loan amount
#     j = monthly interest rate
#     n = loan duration in months

# When you write your program, don't use the single-letter variables m, p, j, and n; use explicit names. For instance, you may want to use loan_amount instead of p.

# Finally, don't forget to run your code through Rubocop.

# Hints:

#     Figure out what format your inputs need to be in. For example, should the interest rate be expressed as 5 or .05, if you mean 5% interest?
#     If you're working with Annual Percentage Rate (APR), you'll need to convert that to a monthly interest rate. (Divide by 12.)
#     Be careful about the loan duration -- are you working with months or years? Choose variable names carefully to assist in remembering.

# Algorithm
#   Statement
#   Prompt loan amount
#   Get loan amount
#     Store to variable
#   Prompt APR
#   Get APR
#     Store to variable
#   Prompt loan duration in months
#   Get loan duration
#     Store to variable
  
  
# Method for APR -> monthly interest rate
#   monthly interest rate variable = APR / 12


def monthly_interest_rate(apr)
  monthly_interest_rate = apr / 12
end

def fraction_to_percentage(fraction)
  fraction * 100
end

def monthly_payment(total_amount, monthly_rate, loan_duration)
  total_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_duration)))
end
monthly_payment_array = []

# method to add trailing zeros to monthly payment amount 
def round(monthly_payment)
  rounded = monthly_payment.round(2).to_s
  monthly_payment_array = rounded.split(//)
  if monthly_payment_array[-2] == "."
    rounded = rounded + "0"
  else
    rounded.to_f
  end
end

# method for output of monthly interest rate
def monthly_print(loan_apr)
  round = (loan_apr * 100).round(3)
  p round
end

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

puts ">> Your monthly interest rate would be #{ monthly_print(monthly_interest_rate) }%"



puts ">> Your monthly payment over #{ loan_duration } months would be $#{ monthly }"

puts ">> If payed on schedule, you will pay $#{ round(total_payment) }"

# m = p * (j / (1 - (1 + j)**(-n)))

#     m = monthly payment
#     p = loan amount
#     j = monthly interest rate
#     n = loan duration in months