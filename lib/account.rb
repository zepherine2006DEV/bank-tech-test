require_relative 'statement'

class Account

  attr_reader :transactions

  def initialize(statement = Statement.new)
    @statement = statement
    @transactions = []
  end

  def print_statement
    @statement.print_statement(@transactions)
  end

  def deposit(amount, date)
    transaction = { deposit: amount, withdrawal: 0, date: date }
    @transactions.push(transaction)
  end

  def withdraw(amount, date)
    transaction = { deposit: 0, withdrawal: amount, date: date }
    @transactions.push(transaction)
  end
end
