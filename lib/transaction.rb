class Transaction
  attr_reader :date, :credit, :debit

  def initialize(credit: nil, debit: nil)
    @date = Time.now.strftime('%d/%m/%Y')
    @credit = credit
    @debit = debit
  end

  def transaction_amount
    return @credit unless @credit.nil?
    return -@debit unless @debit.nil?
  end
end
