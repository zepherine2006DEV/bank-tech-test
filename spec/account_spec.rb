require 'account'

describe Account do
  describe '::new' do
    it 'should have no transactions' do
      expect(subject.transactions.length).to eql(0)
    end
  end

  describe '#deposit' do
    it 'should create a transaction when deposit 10' do
      subject.deposit(10, '01-01-2000')
      expect(subject.transactions[0][:deposit]).to eql(10)
    end
  end

  describe '#withdraw' do
    it 'should create a transaction when withdraw 10' do
      subject.deposit(20, '01-01-2000')
      subject.withdraw(10, '01-02-2000')
      expect(subject.transactions[1][:withdrawal]).to eql(10)
    end
  end
end
