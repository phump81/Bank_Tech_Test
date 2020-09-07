require_relative 'transaction'

class Account

  attr_reader :balance, :transactions

  def initialize(balance = 0, transaction: Transaction)
    @balance = balance
    @transactions = []
    @transaction = transaction
  end

  def deposit(amount)
    @balance += amount
    transaction = Transaction.new(amount, nil, @balance)
    @transactions << transaction
  end

  def withdraw(amount)
    @balance -= amount
    transaction = Transaction.new(nil, amount, @balance)
    @transactions << transaction
  end

  def statement
    puts "date || credit || debit || balance"

    @transactions.reverse.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end
end
