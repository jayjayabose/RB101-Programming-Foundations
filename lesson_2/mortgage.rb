require 'pry'
def prompt(msg)
  puts "==>  #{msg}"
end

def number?(str)
  true if Float(str) rescue false # code smell?
end

def integer?(str)
  true if Integer(str) rescue false # code smell?
end

def calulate_monthly_pmt(loan_amt, term_months, interest_annual)
  (loan_amt * ((interest_annual / 12) / (1 - (1 + (interest_annual / 12))**(-term_months)))).round(2) # this is unreadable
end

loop do
  prompt 'Welcome to the Mortgage Calulator!'
  prompt 'Let\'s get started'

  loan_amt = ''
  loop do
    prompt 'What is the loan amount?'
    loan_amt = gets.chomp
    if number?(loan_amt) && loan_amt.to_f > 0
      loan_amt = loan_amt.to_f
      break
    else
      prompt 'The loan amount entered is invalid'
    end
  end

  term_months = ''
  loop do
    prompt 'What will be the term of the loan (in months)?'
    term_months = gets.chomp
    if integer?(term_months) && term_months.to_i > 0
      term_months = term_months.to_i
      break
    else
      prompt 'The term entered is invalid.'
    end
  end

  interest_annual = ''
  loop do
    prompt 'What will be the interest rate (annual) of the loan?'
    prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
    interest_annual = gets.chomp
    if number?(interest_annual) && interest_annual.to_f > 0
      interest_annual = interest_annual.to_f / 100
      break
    else
      prompt 'The interest rate entered is invalid.'
    end
  end

  monthly_pmt = calulate_monthly_pmt(loan_amt, term_months, interest_annual)
  prompt "Your monthly payment will be: $#{monthly_pmt}"
  prompt "Another calculation?"
  repeat = gets.chomp
  if repeat.downcase.start_with?("n")
    break
  end
end

prompt 'Thanks for using the Mortgage Calulator!'
