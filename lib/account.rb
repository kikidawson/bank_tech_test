require 'date'

class Account
  attr_reader :transactions, :balance
  DATE = DateTime.now.strftime('%d/%m/%Y')

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount)
    update_balance(amount)
    @transactions << [date: DATE, credit: amount, debit: 0, balance: @balance]
    amount
  end

  private

  def update_balance(amount)
    @balance += amount
  end
end
