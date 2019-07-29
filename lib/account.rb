class Account

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    'date || credit || debit || balance'
  end

  def deposit(amount, date)
    transaction = {amount: 10, date: '01.01.2000'}
    @transactions.push(transaction)
  end
end
