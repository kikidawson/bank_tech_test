# frozen_string_literal: true

class Transaction
  DATE = DateTime.now.strftime('%d/%m/%Y')

  attr_reader :date, :credit, :debit, :balance

  def initialize(date: DATE, credit:, debit:, balance:)
    @date = date
    @credit = '%.2f' % credit
    @debit = '%.2f' % debit
    @balance = '%.2f' % balance
  end

  private
  #
  # def two_decimals(integer)
  #   '%.2f' % integer
  # end

end
