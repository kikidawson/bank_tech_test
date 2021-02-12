# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit:, debit:, balance:, date: today)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  private

  def today
    Time.now.strftime('%d/%m/%Y')
  end
end
