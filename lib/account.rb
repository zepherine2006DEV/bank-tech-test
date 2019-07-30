class Account

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    statement_header = "date || credit || debit || balance\n"
    
    statement_rows = @transactions.map do |transaction|
      [transaction[:date], transaction[:deposit], transaction[:withdrawal]]
    end
    
    totals = calculate_balances(statement_rows)
    statement_rows.map.with_index { |element, idx| element[3] = totals[idx] }

    formatted_rows = format_statement(statement_rows)
    
    return statement_header + formatted_rows.reverse.join("\n")
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

private

def calculate_balances(statement_rows)
  totals = []
  statement_rows.inject(0) do |sum, element|
    new_total = sum + element[1] - element[2]
    totals.push(new_total)
    new_total
  end
  totals
end

def format_statement(statement_rows)
  formatted_rows = statement_rows.map do |element|
    "#{element[0].gsub('-', '/')} " +
    "||" +
    (element[1] != 0 ? " #{element[1]}.00 " : " ") +
    "||" +
    (element[2] != 0 ? " #{element[2]}.00 " : " ") +
    "||" +
    " #{element[3]}.00"
  end
  formatted_rows
end
