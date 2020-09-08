class Statement

  def initialize(transactions)
    @transactions = transactions
  end

  def print_statement
    balance = 0
    puts 'date || credit || debit || balance'
    in_order = @transactions.map do |transaction|
      "#{transaction.date} || #{add_pence(transaction.credit)} || #{add_pence(transaction.debit)} || #{add_pence(balance += transaction.transaction_amount)}"
    end
    in_order.reverse.each { |transaction| puts transaction }
  end

  def add_pence(amount)
    '%.2f' % amount unless amount.nil?
  end
end
