# frozen_string_literal: true

require 'statement'

describe Statement do
  subject { described_class.new(transactions) }
  let(:deposit1000) { double :transaction, date: '08/02/2021', credit: 1000, debit: nil, balance: 1000 }
  let(:withdraw500) { double :transaction, date: '09/02/2021', credit: nil, debit: 500, balance: 500 }
  let(:deposit2000) { double :transaction, date: '10/02/2021', credit: 2000, debit: nil, balance: 2500 }
  let(:transactions) { [deposit1000, withdraw500, deposit2000] }

  it 'prints the statement in reverse chronological order' do
    expect { subject.print }.to output(
      "date || credit || debit || balance\n10/02/2021 || 2000.00 ||  || 2500.00\n09/02/2021 ||  || 500.00 || 500.00\n08/02/2021 || 1000.00 ||  || 1000.00\n"
    ).to_stdout
  end
end
