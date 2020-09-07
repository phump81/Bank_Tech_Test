require 'account'

describe Account do
  describe '#deposit' do
    it 'deposits 1000' do
      account = Account.new
      expect(account.balance).to eq(0)
      account.deposit(1000)
      expect(account.balance).to eq(1000)
    end
  end

  describe '#withdrawal' do
    it 'deposits and makes a withdrawal' do
      account = Account.new
      account.deposit(1000)
      expect(account.balance).to eq(1000)
      account.withdraw(500)
      expect(account.balance).to eq(500)
    end
  end
end
