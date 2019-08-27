# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }

  context 'new account' do
    describe '#intialization' do
      it 'should return a 0 balance' do
        expect(account.balance).to eq 0
      end
    end
  end

  context 'depositing' do
    describe '#deposit' do
      it 'should increase balance by deposit amount' do
        account.deposit(100)
        expect(account.balance).to eq 100
      end
    end
  end

  context 'withdrawing' do
    describe '#withdraw' do
      it 'should reduce balance by withdraw amount' do
        account.deposit(1000)
        account.withdraw(100)
        expect(account.balance).to eq 900
      end
      it 'should give message if trying to withdraw too much money' do
        account.deposit(100)
        expect { account.withdraw(200) }.to raise_error('You have insufficent funds for this withdrawal your balance is £100')
      end
    end
  end

  context 'statement' do
    describe '#statement' do
      it 'should show all previous transactions with no history' do
        expect(account.statement).to eq ['Date       || Credit || Debit || Balance ||']
      end
      it 'should show all previous transactions with history' do
        account.deposit(1000)
        account.withdraw(500)
        expect(account.statement).to eq ['Date       || Credit || Debit || Balance ||', '27/08/2019 ||, 1000 ||,  ||, 1000 ||', '27/08/2019 ||,  ||, 500 ||, 500 ||']
      end
    end
  end
end
