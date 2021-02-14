# frozen_string_literal: true

require 'account'

describe Account do
  subject { described_class.new }

  describe '#deposit' do
    it 'adds deposited amount to balance' do
      subject.deposit(1000)

      expect(subject.balance).to eq 1000
    end

    it 'returns the new balance' do
      subject.deposit(1000)

      expect(subject.deposit(1000)).to eq 2000
    end

    it 'raises error if negative amount' do
      expect { subject.deposit(-1000) }.to raise_error 'Amount must be above 0'
    end
  end

  describe '#withdraw' do
    it 'minuses withdrawn amount from balance' do
      subject.withdraw(500)

      expect(subject.balance).to eq(-500)
    end

    it 'returns the new balance' do
      subject.withdraw(500)

      expect(subject.withdraw(500)).to eq(-1000)
    end

    it 'raises error if negative amount' do
      expect { subject.withdraw(-1000) }.to raise_error 'Amount must be above 0'
    end
  end

  describe '#statement' do
    it 'prints a statement with amounts deposited and withdrawn' do
      allow(Time).to receive(:now).and_return(DateTime.parse('2021-02-08 16:11:01 +0000'))
      subject.deposit(1000)
      subject.withdraw(500)

      expect { subject.statement }.to output(
        "date || credit || debit || balance\n08/02/2021 ||  || 500.00 || 500.00\n08/02/2021 || 1000.00 ||  || 1000.00\n"
      ).to_stdout
    end
  end
end
