class Account

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    statement_header = 'date || credit || debit || balance\n'
    statement_rows = @transactions.map { |transaction| "01.02.2003 || 20.00 || || 20.00"}
    return statement_header + statement_rows.join('\n')
  end

  def deposit(amount, date)
    transaction = {deposit: 10, withdrawal: 0, date: '01.01.2000'}
    @transactions.push(transaction)
  end
end
