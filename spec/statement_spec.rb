require 'statement'

describe Statement do

  let(:account) { Account.new }
  let(:deposit) { account.deposit(1000) }
  let(:withdrawal) { account.withdraw(500) }

  it 'prints an empty statement' do
    expect { account.statement }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'prints a statement with transactions' do
    allow(Time).to receive(:now) { Time.mktime(2020,9,8) }
    deposit
    withdrawal
    expect { account.statement }.to output("date || credit || debit || balance\n"\
  "08/09/2020 ||  || 500.00 || 500.00\n"\
  "08/09/2020 || 1000.00 ||  || 1000.00\n").to_stdout
  end
end
