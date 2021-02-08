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
      amount = 1000
      expect(subject.deposit(amount)).to eq amount
    end
  end
end
