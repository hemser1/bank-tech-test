# frozen_string_literal: true

require 'transactions'

describe Transactions do
  subject(:transactions) { described_class.new }

  context 'show transactions' do
    describe '#intialization' do
      it 'should return an empty array of transactions' do
        expect(transactions.history).to eq []
      end
    end

    describe 'add transactions' do
      it 'should add a transaction' do
        date = Time.now.strftime('%d/%m/%Y')
        credit = 200
        balance = 300
        transactions.submit(credit, nil, balance)
        expect(transactions.history).to eq ["#{date} ||, 200 ||,  ||, 300 ||"]
      end
    end

    describe 'formats transaction printing' do
      it 'should populate first element of history with column titles' do
        expect(transactions.statement).to eq ['Date       || Credit || Debit || Balance ||']
      end
    end

    describe 'show transactions' do
      it 'should show transaction history for deposits' do
        date = Time.now.strftime('%d/%m/%Y')
        credit = 200
        balance = 300
        transactions.submit(credit, nil, balance)
        expect(transactions.statement).to eq ["Date       || Credit || Debit || Balance ||", "#{date} ||, 200 ||,  ||, 300 ||"]
      end
      it 'should show transaction history for withdrawals' do
        date = Time.now.strftime('%d/%m/%Y')
        debit = 200
        balance = 300
        transactions.submit(nil, debit, balance)
        debit = 50
        balance = 100
        transactions.submit(nil, debit, balance)
        expect(transactions.statement).to eq ["Date       || Credit || Debit || Balance ||", "#{date} ||,  ||, 200 ||, 300 ||", "#{date} ||,  ||, 50 ||, 100 ||"]
      end
    end
  end
end
