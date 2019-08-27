# frozen_string_literal: true

require_relative 'account'

class Transactions
  attr_reader :history, :date

  def initialize
    @history = []
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def submit(credit = nil, debit = nil, balance)
    @history << "#{date} ||, #{credit} ||, #{debit} ||, #{balance} ||"
  end

  def statement
    @history.unshift('Date       || Credit || Debit || Balance ||')
    @history.each { |string| puts string }
  end
end
