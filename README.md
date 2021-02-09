# bank_tech_test

## Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

## How to run the code
```
$ git clone git@github.com:kikidawson/bank_tech_test.git
$ cd bank_tech_test
$ irb -r './lib/account.rb'
```

### How to run the tests
```
$ bundle install
$ rspec
```

## Planning

### How should it work
```
$ account.deposit(1000)
> +1000 on 07/02/2021
$ account.withdraw(500)
> -500 on 07/02/2021
$ account.statement
> date || credit || debit || balance
> 07/02/2021 || || 500.00 || 500.00
> 07/02/2021 || 1000.00 || || 1000.00
```

### User Stories

```
As a user
So I can keep money safe
I would like to deposit money

As a user
So that I can use money
I would like to withdraw money

As a user
So that I can keep track of my account
I would like to see my statement (see format below).
```

#### Statement Format

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Domain Modelling

| Object | Owner/Property |
| ------- | -------- |
| Account | Owner |
| Transactions | Property of Account |
| Transaction | Owner |
| Date | Property of Transaction |
| Credit | Property of Transaction |
| Debit | Property of Transaction |
| Balance | Property of Transaction |

| Action | Owned by? |
| ------- | -------- |
| Deposit | Account |
| Withdraw | Account |
| Print Statement | Account |

| Action | Property it reads or changes |
| ------- | -------- |
| Deposit | transactions |
| Withdraw | transactions |
| Print Statement | transactions |

| Class | Account |
| -------- | -------- |
| Properties | transactions |
| Actions | deposit, withdraw, print_statement |

| Class | Transaction |
| -------- | -------- |
| Properties | date, credit, debit, new_balance |
| Actions | |
