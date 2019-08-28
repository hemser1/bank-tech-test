# frozen_string_literal: true

require 'statement'

describe Statement do
    subject(:statement) { described_class.new }

  describe 'prints statement' do
    it 'should populate first element of history with column titles' do
      history = []
      expect(statement.show(history)).to eq ['Date       || Credit || Debit || Balance ||']
    end
      it 'should print transactions added to transactions' do
      history = ["28/08/2019 ||, 200 ||,  ||, 300 ||"]
      expect(statement.show(history)).to eq ["Date       || Credit || Debit || Balance ||", "28/08/2019 ||, 200 ||,  ||, 300 ||"]
    end
  end
end
