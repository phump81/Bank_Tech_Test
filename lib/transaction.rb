class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit: nil, debit: nil, balance: nil)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = and_pence(credit)
    @debit = and_pence(debit)
    @balance = and_pence(balance)
  end

  def and_pence(amount)
    '%.2f' % amount unless amount.nil?
  end
end
