require 'transactions'

describe Transactions do
  subject(:transactions) { described_class.new }

  context 'show transactions' do
    describe '#intialization' do
      it "should return an empty array of transactions" do
        expect(transactions.history).to eq []
      end
    end

    describe "add transactions" do
      it "should add a transaction" do
        date = "27/08/2019"
        credit = 200
        balance = 300
        transactions.submit(date, credit, nil, balance)
        expect(transactions.history[0]).to eq ["27/08/2019", 200, nil, 300]
      end
    end
    describe "show transactions" do
      it "should show transaction history for deposits" do
        date = "27/08/2019"
        credit = 200
        balance = 300
        transactions.submit(date, credit, nil, balance)
        expect(transactions.history).to eq [["27/08/2019", 200, nil, 300]]
      end
      it "should show transaction history for withdrawals" do
        date = "27/08/2019"
        debit = 200
        balance = 300
        transactions.submit(date, nil, debit, balance)
        expect(transactions.history).to eq [["27/08/2019", nil, 200, 300]]
      end
    end
  end
end
