require 'account'

describe 'Assessment Criteria' do
  it 'Prints a statement with most recent transaction first' do
    @account = Account.new
    first_deposit
    second_deposit
    withdrawal
    expect { @account.statement }.to output("date || credit || debit || balance\n"\
  "14/01/2012 ||  || 500.00 || 2500.00\n"\
  "13/01/2012 || 2000.00 ||  || 3000.00\n"\
  "10/01/2012 || 1000.00 ||  || 1000.00\n").to_stdout
  end
end

def first_deposit
  allow(Time).to receive(:now) { Time.mktime(2012,1,10) }
  @account.deposit(1000)
end

def second_deposit
  allow(Time).to receive(:now) { Time.mktime(2012,1,13) }
  @account.deposit(2000)
end

def withdrawal
  allow(Time).to receive(:now) { Time.mktime(2012,1,14) }
  @account.withdraw(500)
end
