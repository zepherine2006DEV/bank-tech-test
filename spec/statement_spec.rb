require 'statement'

statement_header = "date || credit || debit || balance\n"

describe Statement do
  describe '#print_statement' do
    it 'should show headings only when there are no transactions' do
      expect(subject.print_statement([])).to eql(statement_header)
    end

    it 'should show a single deposit' do
      statement_row = "01/02/2003 || 20.00 || || 20.00"
      transactions = [{ date: "01-02-2003", deposit: 20, withdrawal: 0 }]
      expect(subject.print_statement(transactions)).to eql(statement_header + statement_row)
    end

    it 'should show two deposits' do
      statement_row_2 = "01/02/2003 || 20.00 || || 20.00"
      statement_row_1 = "01/03/2003 || 20.00 || || 40.00\n"
      transactions = [
        { date: "01-02-2003", deposit: 20, withdrawal: 0 },
        { date: "01-03-2003", deposit: 20, withdrawal: 0 }
        ]
      expect(subject.print_statement(transactions)).to eql(statement_header + statement_row_1 + statement_row_2)
    end

    it 'should calculate balance for deposit followed by withdrawal' do
      statement_row_3 = "01/02/2003 || 20.00 || || 20.00"
      statement_row_2 = "01/03/2003 || 20.00 || || 40.00\n"
      statement_row_1 = "01/04/2003 || || 10.00 || 30.00\n"
      transactions = [
        { date: "01-02-2003", deposit: 20, withdrawal: 0 },
        { date: "01-03-2003", deposit: 20, withdrawal: 0 },
        { date: "01-04-2003", deposit: 0, withdrawal: 10 }
        ]
      expect(subject.print_statement(transactions)).to eql(statement_header + statement_row_1 + statement_row_2 + statement_row_3)
    end

  end
end
