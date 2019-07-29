require 'account'

describe Account do
  describe '::new' do
    it 'should have a zero balance' do
      expect(subject.balance).to eql(0)
    end
  end

  describe '#print_statement' do
    it 'should show headings only when account is first initialzed' do
      expect(subject.print_statement).to eql('date || credit || debit || balance')
    end
  end
end
