# frozen_string_literal: true

require 'account'

describe Account do
  # subject { described_class.new(transaction_class_double) }
  # let(:transaction_double) { double :transaction, date: '08/02/2021' }
  # let(:transaction_class_double) { double :transaction_class, new: transaction_double }

  it 'allows instances of a class to be created' do
    expect(subject).to be_kind_of Account
  end

  describe '#deposit' do
    it 'accepts the method with one argument' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end

    it 'adds deposited amount to balance' do
      subject.deposit(1000)

      expect(subject.balance).to eq 1000
    end

    it 'adds shows in credit on statement' do
      subject.deposit(1000)

      expect { subject.print_statement }.to output(
        "date || credit || debit || balance\n#{Transaction::DATE} || 1000.00 ||  || 1000.00\n"
      ).to_stdout
    end
  end

  describe '#withdraw' do
    it 'accepts the method with one argument' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end

    it 'minuses withdrawn amount from balance' do
      subject.withdraw(500)

      expect(subject.balance).to eq -500
    end

    it 'amount shows in debit on statement' do
      subject.withdraw(500)

      expect { subject.print_statement }.to output(
        "date || credit || debit || balance\n#{Transaction::DATE} ||  || 500.00 || -500.00\n"
      ).to_stdout
    end
  end

  describe '#print_statement' do
    it 'prints in reverse order' do
      subject.deposit(1000)
      subject.withdraw(500)

      expect { subject.print_statement }.to output(
        "date || credit || debit || balance\n#{Transaction::DATE} ||  || 500.00 || 500.00\n#{Transaction::DATE} || 1000.00 ||  || 1000.00\n"
      ).to_stdout
    end
  end
end
