# frozen_string_literal: true

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(credit:, debit:, balance:, date: today)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  # private
  #
  # def convert(value)
  #   format('%.2f', value) if value.is_a? Integer
  # end
  #
  def today
    Time.now.strftime('%d/%m/%Y')
  end
end
