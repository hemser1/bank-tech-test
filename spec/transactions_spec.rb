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
  end
  context 'save transactions through submit' do
    describe 'show transactions' do
      it 'should save transaction history for deposits' do
        date = Time.now.strftime('%d/%m/%Y')
        credit = 200
        balance = 300
        expect(transactions.submit(credit, nil, balance)).to eq [
          "#{date} ||, 200 ||,  ||, 300 ||"
        ]
      end
      it 'should save transaction history for withdrawals' do
        date = Time.now.strftime('%d/%m/%Y')
        debit = 200
        balance = 300

        expect(transactions.submit(nil, debit, balance)).to eq [
          "#{date} ||,  ||, 200 ||, 300 ||"
        ]
      end
      it "should save multiple transactions to history" do
        date = Time.now.strftime('%d/%m/%Y')
        debit = 200
        balance = 300
        transactions.submit(nil, debit, balance)
        date = Time.now.strftime('%d/%m/%Y')
        credit = 2000
        balance = 5000
        expect(transactions.submit(credit, nil, balance)).to eq [
          "#{date} ||,  ||, 200 ||, 300 ||",
          "#{date} ||, 2000 ||,  ||, 5000 ||"
          ]
      end
    end
  end
end
