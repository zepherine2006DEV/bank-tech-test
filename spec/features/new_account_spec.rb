require 'account'

describe 'new account feature' do
  it 'should create a new account with initalised values' do
    account = Account.new
    expect(account.class).to eql(Account)
    expect(account.balance).to eql(0)
    expect(account.print_statement).to eql('date || credit || debit || balance')
  end
end
