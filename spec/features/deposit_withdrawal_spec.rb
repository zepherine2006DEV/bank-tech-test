require 'account'

describe 'deposit and withdrawal feature' do
  it 'should display a statement after multiple deposits and withdrawals' do
    account = Account.new
    account.deposit(1000, '10-01-2012')
    expect(account.print_statement).to eql(
      'date || credit || debit || balance/n10/01/2012 || 1000.00 || || 1000.00'
      )
    account.deposit(2000, '13-01-2012')
    expect(account.print_statement).to eql(
      'date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00'
      )
    account.withdrawer(500, '14-01-2012')
    expect(account.print_statement).to eql(
      'date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00'
      )
  end
end
