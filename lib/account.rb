# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance

  def initialize(transaction_class = Transaction, statement_class = Statement)
    @statement_class = statement_class
    @transaction_class = transaction_class
    @transactions = []
    @balance = 0
  end

  def deposit(amount)
    raise 'Amount must be above 0' if amount <= 0

    update_balance(amount)
    save_transaction(credit: amount)
    @balance
  end

  def withdraw(amount)
    update_balance(-amount)
    save_transaction(debit: amount)
    @balance
  end

  def statement
    statement = @statement_class.new(@transactions)
    statement.print
  end

  private

  def save_transaction(credit: nil, debit: nil)
    transaction = @transaction_class.new(credit: credit, debit: debit, balance: @balance)
    @transactions << transaction
  end

  def update_balance(amount)
    @balance += amount
  end
end
