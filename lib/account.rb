require_relative 'transaction'
require_relative 'statement'

class Account

  attr_reader :transaction_history

  def initialize
    @transaction_history = []
  end

  def deposit(amount)
    transaction = Transaction.new(credit: amount)
    @transaction_history << transaction
  end

  def withdraw(amount)
    transaction = Transaction.new(debit: amount)
    @transaction_history << transaction
  end

  def statement
    statement = Statement.new(@transaction_history)
    statement.print_statement
  end

  def current_balance
    balance = 0
    @transaction_history.each { |transaction| balance += transaction.transaction_amount }
    return balance
  end
end
