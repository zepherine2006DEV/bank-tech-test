require 'account'

statement_header = "date || credit || debit || balance\n"

describe Account do
  describe '::new' do
    it 'should have no transactions' do
      expect(subject.transactions.length).to eql(0)
    end
  end

  describe '#print_statement' do
    it 'should show headings only when account is first initialzed' do
      expect(subject.print_statement).to eql(statement_header)
    end
  end

  describe '#print_statement' do
    it 'should show a single deposit' do
      statement_row = '01.02.2003 || 20.00 || || 20.00'
      subject.deposit(20, '01.02.2003')
      expect(subject.print_statement).to eql(statement_header + statement_row)
    end
  end

  describe '#deposit' do
    it 'should deposit 10 with a valid date' do
      subject.deposit(10, '01.01.2000')
      expect(subject.transactions[0]).to eql({deposit: 10, withdrawal: 0, date: '01.01.2000'})
    end
  end
end
