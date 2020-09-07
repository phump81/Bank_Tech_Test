require 'account'

describe Account do
  let(:account) { Account.new }
  let(:deposit) { account.deposit(1000) }
  let(:withdrawal) { account.withdraw(500) }

  describe '#deposit' do
    it 'deposits 1000' do
      expect(account.balance).to eq(0)
      deposit
      expect(account.balance).to eq(1000)
    end
  end

  describe '#withdrawal' do
    it 'deposits and makes a withdrawal' do
      deposit
      expect(account.balance).to eq(1000)
      withdrawal
      expect(account.balance).to eq(500)
    end
  end

  describe '#statement' do
    it 'prints an empty statement' do
      expect { account.statement }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end
