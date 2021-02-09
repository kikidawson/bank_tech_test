# frozen_string_literal: true

class Transaction
  DATE = DateTime.now.strftime('%d/%m/%Y')

  attr_reader :date, :credit, :debit, :balance

  def initialize(credit:, debit:, balance:, date: DATE)
    @date = date
    @credit = convert(credit)
    @debit = convert(debit)
    @balance = convert(balance)
  end

  private

  def convert(value)
    format('%.2f', value) if value.is_a? Integer
  end
end
