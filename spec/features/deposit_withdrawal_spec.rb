require 'account'

describe 'deposit and withdrawal feature' do
  it 'should display a statement after multiple deposits and withdrawals' do
    account = Account.new
    account.deposit(1000,'10-01-2012')
    expect(account.balance).to eql(1000)
    expect(account.print_statement).to eql(
      'date || credit || debit || balance/n
      10/01/2012 || 1000.00 || || 1000.00'
      )
    account.deposit(2000,'13-01-2012')
    expect(account.balance).to eql(3000)
    expect(account.print_statement).to eql(
      'date || credit || debit || balance\n
      13/01/2012 || 2000.00 || || 3000.00\n
      10/01/2012 || 1000.00 || || 1000.00'
      )
    account.withdrawer(500,'14-01-2012')
    expect(account.balance).to eql(2500)
    expect(account.print_statement).to eql(
      'date || credit || debit || balance\n
      14/01/2012 || || 500.00 || 2500.00\n
      13/01/2012 || 2000.00 || || 3000.00\n
      10/01/2012 || 1000.00 || || 1000.00'
      )
  end
end
