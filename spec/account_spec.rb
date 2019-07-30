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
      statement_row = "01.02.2003 || 20.00 || || 20.00"
      subject.deposit(20, '01.02.2003')
      expect(subject.print_statement).to eql(statement_header + statement_row)
    end
  end

  describe '#print_statement' do
    it 'should show two deposits' do
      statement_row_1 = "01.02.2003 || 20.00 || || 20.00\n"
      statement_row_2 = "01.03.2003 || 20.00 || || 40.00"
      subject.deposit(20, '01.02.2003')
      subject.deposit(20, '01.03.2003')
      expect(subject.print_statement).to eql(statement_header + statement_row_1 + statement_row_2)
    end
  end

  describe '#print_statement' do
    it 'should calculate balance for deposit followed by withdrawal' do
      statement_row_1 = "01.02.2003 || 20.00 || || 20.00\n"
      statement_row_2 = "01.03.2003 || 20.00 || || 40.00\n"
      statement_row_3 = "01.04.2003 || || 10.00 || 30.00"
      subject.deposit(20, '01.02.2003')
      subject.deposit(20, '01.03.2003')
      subject.withdraw(10, '01.04.2003')
      expect(subject.print_statement).to eql(statement_header + statement_row_1 + statement_row_2 + statement_row_3)
    end
  end

  describe '#deposit' do
    it 'should create a transaction when deposit 10' do
      subject.deposit(10, '01.01.2000')
      expect(subject.transactions[0][:deposit]).to eql(10)
    end
  end

  describe '#withdraw' do
    it 'should create a transaction when withdraw 10' do
      subject.deposit(20, '01.01.2000')
      subject.withdraw(10, '01.02.2000')
      expect(subject.transactions[1][:withdrawal]).to eql(10)
    end
  end
end
