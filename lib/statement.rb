# frozen_string_literal: true

class Statement
  def initialize(transactions)
    @transactions = transactions
    @stringified_transactions = ['date || credit || debit || balance']
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
    puts @stringified_transactions
  end

  def stringify(transaction)
    "#{transaction.date} || #{converted_credit(transaction)} || #{converted_debit(transaction)} || #{converted_balance(transaction)}"
  end

  def convert(value)
    format('%.2f', value) if value.is_a? Integer
  end

  def converted_credit(transaction)
    convert(transaction.credit)
  end

  def converted_debit(transaction)
    convert(transaction.debit)
  end

  def converted_balance(transaction)
    convert(transaction.balance)
  end
end
