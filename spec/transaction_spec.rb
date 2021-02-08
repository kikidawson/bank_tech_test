require 'transaction'

describe Transaction do
  subject { described_class.new(date: '08/02/2021', credit: 1000, debit: 0, balance: 1000) }

  it 'allows instances of a class to be created' do
    expect(subject).to be_kind_of Transaction
  end

  it 'can return the transaction date' do
    expect(subject.date).to eq '08/02/2021'
  end

  it 'can return how much is being credited' do
    expect(subject.credit).to eq 1000
  end

  it 'can return how much is being debited' do
    expect(subject.debit).to eq 0
  end

  it 'can return the balance' do
    expect(subject.balance).to eq 1000
  end
end
