require 'transaction'
require 'account'

describe Transaction do
  let(:account) { Account.new }
  let(:deposit) { account.deposit(1000) }
  let(:withdrawal) { account.withdraw(500) }

  it 'creates a new deposit transaction' do
    deposit
    expect(account.transaction_history.length).to eq(1)
    expect(account.transaction_history[0].credit).to eq(1000)
    expect(account.transaction_history[0].debit).to eq(nil)
  end

  it 'creates a new withdrawal transaction' do
    withdrawal
    expect(account.transaction_history.length).to eq(1)
    expect(account.transaction_history[0].credit).to eq(nil)
    expect(account.transaction_history[0].debit).to eq(500)
  end

  it 'adds two decimal places to an integer' do
    transaction = Transaction.new(credit: 1000)
    expect(transaction.credit).to eq(1000)
  end
end
