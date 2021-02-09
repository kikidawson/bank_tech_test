# frozen_string_literal: true

require 'account'

describe Account do
  subject { described_class.new }

  it 'allows instances of a class to be created' do
    expect(subject).to be_kind_of Account
  end

  describe '#deposit' do
    it 'accepts the method with one argument' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end

    it 'returns the amount deposited' do
      expect(subject.deposit(1000)).to eq 1000
    end

    it 'adds deposited amount to balance' do
      subject.deposit(1000)

      expect(subject.balance).to eq 1000
    end

    it 'adds shows in credit on statement' do
      subject.deposit(1000)

      expect { subject.print_statement }.to output(
        "date || credit || debit || balance\n#{Account::DATE} || 1000 || 0 || 1000\n"
      ).to_stdout
    end
  end

  describe '#withdraw' do
    it 'accepts the method with one argument' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end

    it 'returns the amount withdrawn' do
      expect(subject.withdraw(500)).to eq 500
    end

    it 'minuses withdrawn amount from balance' do
      subject.withdraw(500)

      expect(subject.balance).to eq -500
    end

    it 'amount shows in debit on statement' do
      subject.withdraw(500)

      expect { subject.print_statement }.to output(
        "date || credit || debit || balance\n#{Account::DATE} || 0 || 500 || -500\n"
      ).to_stdout
    end
  end

  describe '#print_statement' do
    it 'prints in reverse order' do
      subject.deposit(1000)
      subject.withdraw(500)

      expect { subject.print_statement }.to output(
        "date || credit || debit || balance\n#{Account::DATE} || 0 || 500 || 500\n#{Account::DATE} || 1000 || 0 || 1000\n"
      ).to_stdout
    end
  end
end
