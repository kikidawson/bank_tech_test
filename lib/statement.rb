# frozen_string_literal: true

class Statement
  def initialize(transactions)
    @transactions = transactions
    @stringified_transactions = [ "date || credit || debit || balance" ]
  end

  def print
    stringify_transactions
    print_stringified_transactions
  end

  private

  def stringify_transactions
    @transactions.reverse_each do |transaction|
      @stringified_transactions << stringify(transaction)
    end
  end

  def print_stringified_transactions
    @stringified_transactions.each do |transaction|
      puts transaction
    end
  end

  def stringify(transaction)
    "#{transaction.date} || #{convert(transaction.credit)} || #{convert(transaction.debit)} || #{convert(transaction.balance)}"
  end

  def convert(value)
    format('%.2f', value) if value.is_a? Integer
  end

end
