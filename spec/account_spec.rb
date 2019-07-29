require 'account'

describe Account do
  describe '::new' do
    it 'should have a zero balance' do
      expect(subject.balance).to eql(0)
    end
  end
end
