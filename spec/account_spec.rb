# frozen_string_literal: true

require 'account'

describe Account do
  subject { described_class.new }

  before(:each) do
    allow(Time).to receive(:now).and_return(DateTime.parse('2021-02-08 16:11:01 +0000'))
  end

  describe '#deposit' do
    it 'accepts the method with one argument' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end

    it 'adds deposited amount to balance' do
      subject.deposit(1000)

      expect(subject.balance).to eq 1000
    end

    it 'returns the new balance' do
      subject.deposit(1000)

      expect(subject.deposit(1000)).to eq 2000
    end

    it 'adds shows in credit on statement' do
      subject.deposit(1000)

      expect { subject.statement }.to output(
        "date || credit || debit || balance\n08/02/2021 || 1000.00 ||  || 1000.00\n"
      ).to_stdout
    end
  end

  describe '#withdraw' do
    it 'accepts the method with one argument' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end

    it 'minuses withdrawn amount from balance' do
      subject.withdraw(500)

      expect(subject.balance).to eq(-500)
    end

    it 'returns the new balance' do
      subject.withdraw(500)

      expect(subject.withdraw(500)).to eq(-1000)
    end

    # it 'amount shows in debit on statement' do
    #   subject.withdraw(500)
    #
    #   expect { subject.statement }.to output(
    #     "date || credit || debit || balance\n08/02/2021 ||  || 500.00 || -500.00\n"
    #   ).to_stdout
    # end
  end

  # describe '#statement' do
  #   it 'prints in reverse order' do
  #     subject.deposit(1000)
  #     subject.withdraw(500)
  #
  #     expect { subject.statement }.to output(
  #       "date || credit || debit || balance\n08/02/2021 ||  || 500.00 || 500.00\n08/02/2021 || 1000.00 ||  || 1000.00\n"
  #     ).to_stdout
  #   end
  # end
end
