# frozen_string_literal: true

class Statement
  def initialize(transactions)
    @transactions = transactions
  end

  def print
    puts "date || credit || debit || balance\n"
    @transactions.reverse_each do |transaction|
      puts "#{transaction.date} || #{convert(transaction.credit)} || #{convert(transaction.debit)} || #{convert(transaction.balance)}\n"
    end
  end

  private

  def convert(value)
    format('%.2f', value) if value.is_a? Integer
  end

end
