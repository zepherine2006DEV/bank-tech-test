require 'account'

describe Account do
  describe '::new' do
    it 'should have no transactions' do
      expect(subject.transactions.length).to eql(0)
    end
  end

  describe '#print_statement' do
    it 'should show headings only when account is first initialzed' do
      expect(subject.print_statement).to eql('date || credit || debit || balance')
    end
  end

  describe '#deposit' do
    it 'should deposit 10 with a valid date' do
      subject.deposit(10, '01.01.2000')
      expect(subject.transactions[0]).to eql({amount: 10, date: '01.01.2000'})
    end
  end
end
