# frozen_string_literal: true
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
    transaction = Transaction.new(date: DATE, credit: amount, debit: 0, balance: @balance)
    @transactions << transaction
    amount
  end

  def print_statement
    puts "date || credit || debit || balance\n"
    @transactions.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
    end
  end

  private

  def update_balance(amount)
    @balance += amount
  end
end
