require_relative 'account'

class Transactions
  attr_reader :history, :date

  def initialize
    @history = []
    @date = Time.now
  end

  def submit(date, credit = nil, debit = nil, balance)
    @history << [date, credit, debit, balance]
  end

  def statement
    @history
  end
end
