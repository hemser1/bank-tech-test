require_relative 'account'
require_relative 'transactions'

class Statement

  def show(history)
    history.unshift('Date       || Credit || Debit || Balance ||')
    history.each { |string| puts string }
  end

end
