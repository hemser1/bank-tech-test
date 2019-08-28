# frozen_string_literal: true

require_relative 'transactions'
require_relative 'statement'

class Account
  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = Transactions.new
    @statement = Statement.new
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
    @statement = Statement.new
    @statement.show(transaction_history.history)
  end

  private

  def lack_of_funds
    "Insufficent funds for this withdrawal your balance is £#{@balance}"
  end
end
