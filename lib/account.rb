# frozen_string_literal: true

require_relative 'transaction'

class Account
  attr_reader :balance

  def initialize(transaction_class = Transaction)
    @transaction_class = transaction_class
    @transactions = []
    @balance = 0
  end

  def deposit(amount)
    update_balance(amount)
    save_transaction(credit: amount)
    @balance
  end

  def withdraw(amount)
    update_balance(-amount)
    save_transaction(debit: amount)
    @balance
  end

  # def statement
  #   puts "date || credit || debit || balance\n"
  #   @transactions.reverse_each do |transaction|
  #     puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
  #   end
  # end

  private

  def save_transaction(credit: nil, debit: nil)
    transaction = @transaction_class.new(credit: credit, debit: debit, balance: @balance)
    @transactions << transaction
  end

  def update_balance(amount)
    @balance += amount
  end
end
