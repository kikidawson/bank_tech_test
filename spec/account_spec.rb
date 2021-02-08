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

    it 'adds transaction to transactions list' do
      subject.deposit(1000)

      expect { subject.print_statement }.to output("date || credit || debit || balance\n08/02/2021 || 1000 || 0 || 1000\n").to_stdout
    end

    it 'updates account balance' do
      subject.deposit(1000)
      subject.deposit(1000)

      expect { subject.print_statement }.to output("date || credit || debit || balance\n08/02/2021 || 1000 || 0 || 1000\n08/02/2021 || 1000 || 0 || 2000\n").to_stdout
    end
  end
end
