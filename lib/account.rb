require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize(transaction: Transaction)
    @transactions = []
    @transaction = transaction
  end

  def deposit(amount)
    transaction = Transaction.new(credit: amount)
    @transactions << transaction
  end

  def withdraw(amount)
    transaction = Transaction.new(debit: amount)
    @transactions << transaction
  end

  def statement
    balance = 0
    puts 'date || credit || debit || balance'
    in_order = @transactions.map do |transaction|
      "#{transaction.date} || #{add_pence(transaction.credit)} || #{add_pence(transaction.debit)} || #{add_pence(balance += transaction.transaction_amount)}"
    end
    in_order.reverse.each { |transaction| puts transaction }
  end

  def current_balance
    balance = 0
    @transactions.each { |transaction| balance += transaction.transaction_amount }
    return balance
  end

  def add_pence(amount)
    '%.2f' % amount unless amount.nil?
  end
end
