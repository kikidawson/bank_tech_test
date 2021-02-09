# frozen_string_literal: true

class Transaction
  DATE = DateTime.now.strftime('%d/%m/%Y')

  attr_reader :date, :credit, :debit, :balance

  def initialize(date: DATE, credit:, debit:, balance:)
    @date = date
    @credit = convert(credit)
    @debit = convert(debit)
    @balance = convert(balance)
  end

  private

  def convert(value)
    if value.kind_of? Integer
      '%.2f' % value
    end
  end

end
