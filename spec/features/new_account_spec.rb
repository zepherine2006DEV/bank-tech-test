require 'account'

describe 'new account feature' do
  it 'should create a new account with initalised values' do
    account = Account.new
    expect(account.class).to eql(Account)
    expect(account.print_statement).to eql('date || credit || debit || balance\n')
  end
end
