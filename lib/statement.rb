# frozen_string_literal: true

class Statement
  def initialize(transactions)
    # transaction = [ one, two, three ]
    @transactions = transactions
    @transactions_stringify = [("date || credit || debit || balance")]
  end

  def print
    @transactions.reverse_each do |transaction|
      @transactions_stringify << "#{transaction.date} || #{convert(transaction.credit)} || #{convert(transaction.debit)} || #{convert(transaction.balance)}"
    end
    @transactions_stringify.each do |transaction|
      puts transaction
    end
  end

  private

  def print_each(transaction)
  end

  def convert(value)
    format('%.2f', value) if value.is_a? Integer
  end

end
