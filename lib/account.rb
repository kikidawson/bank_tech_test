# frozen_string_literal: true

require 'date'
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
    save(credit: amount, debit:nil, balance: @balance)
    amount
  end

  def withdraw(amount)
    update_balance(-amount)
    save(credit: nil, debit: amount, balance: @balance)
    amount
  end

  def statement
    puts "date || credit || debit || balance\n"
    @transactions.reverse_each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}\n"
    end
  end

  private

  def save(credit:, debit:, balance:)
    @transactions << @transaction_class.new(credit: credit, debit: debit, balance: balance)
  end

  def update_balance(amount)
    @balance += amount
  end
end
