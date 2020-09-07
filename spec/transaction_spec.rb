require 'transaction'
require 'account'

describe Transaction do
  let(:account) { Account.new }
  let(:deposit) { account.deposit(1000) }
  let(:withdrawal) { account.withdraw(500) }

  it 'creates a new deposit transaction' do
    deposit
    expect(account.transactions.length).to eq(1)
  end

  it 'creates a new withdrawal transaction' do
    withdrawal
    expect(account.transactions.length).to eq(1)
  end
end
