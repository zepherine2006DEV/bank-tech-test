class Account

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    statement_header = "date || credit || debit || balance\n"
    statement_rows = @transactions.map { |transaction| [transaction[:date],transaction[:deposit],transaction[:withdrawal]] }
    totals = []
    rows_with_totals = statement_rows.inject(0) do |sum, element|
         new_total = sum + element[1]
         totals.push(new_total)
         new_total
       end
    statement_rows.map.with_index { |element, idx| element[3] = totals[idx] }#element.push(totals[idx]) }
    formatted_rows = statement_rows.map { |element| "#{element[0]} || #{element[1]}.00 || || #{element[3]}.00"}
    return statement_header + formatted_rows.join("\n")
  end

  def deposit(amount, date)
    transaction = {deposit: amount, withdrawal: 0, date: date}
    @transactions.push(transaction)
  end
end
