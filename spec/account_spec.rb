require 'account'

describe Account do
  describe '#deposit' do
    it 'deposits 1000' do
      account = Account.new
      account.deposit(1000)
      expect(account.balance).to eq(1000)
    end
  end
end
