# frozen_string_literal: true

class Statement
  def initialize(transactions)
    @transactions = transactions
  end

  def print
    puts "date || credit || debit || balance"
    stringify_transactions
    @transactions.reverse_each do |transaction|
      puts transaction
    end
  end

  private

  def stringify_transactions
    @transactions.map! do |transaction|
      "#{transaction.date} || #{convert(transaction.credit)} || #{convert(transaction.debit)} || #{convert(transaction.balance)}"
    end
  end

  def convert(value)
    format('%.2f', value) if value.is_a? Integer
  end

end
