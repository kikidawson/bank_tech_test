# frozen_string_literal: true

class Transaction
  DATE = DateTime.now.strftime('%d/%m/%Y')

  attr_reader :date, :credit, :debit, :balance

  def initialize(date: DATE, credit:, debit:, balance:)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end
end
