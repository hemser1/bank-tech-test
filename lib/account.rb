# frozen_string_literal: true

require_relative 'transactions'

class Account
  attr_reader :balance

  def initialize
    @balance = 0
    @transaction_history = Transactions.new
  end

  def deposit(credit)
    @balance += credit
    @transaction_history.submit(credit, nil, balance)
  end

  def withdraw(debit)
    raise lack_of_funds if debit > @balance

    @balance -= debit
    @transaction_history.submit(nil, debit, balance)
  end

  def statement
    @transaction_history.statement
  end

  private

  def lack_of_funds
    "You have insufficent funds for this withdrawal your balance is £#{@balance}"
  end
end
