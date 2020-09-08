require 'transaction'
require 'account'

describe Transaction do
  let(:account) { Account.new }
  let(:deposit) { account.deposit(1000) }
  let(:withdrawal) { account.withdraw(500) }

  it 'creates a new deposit transaction' do
    deposit
    expect(account.transactions.length).to eq(1)
    expect(account.transactions[0].credit).to eq('1000.00')
    expect(account.transactions[0].debit).to eq(nil)
    expect(account.transactions[0].balance).to eq('1000.00')
  end

  it 'creates a new withdrawal transaction' do
    withdrawal
    expect(account.transactions.length).to eq(1)
    expect(account.transactions[0].credit).to eq(nil)
    expect(account.transactions[0].debit).to eq('500.00')
    expect(account.transactions[0].balance).to eq('-500.00')
  end

  it 'adds two decimal places to an integer' do
    transaction = Transaction.new(credit: 1000)
    expect(transaction.credit).to eq('1000.00')
  end
end
