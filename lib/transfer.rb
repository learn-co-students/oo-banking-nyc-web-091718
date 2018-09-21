require 'pry'

class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end


  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end


  def execute_transaction
    if self.valid? && self.status == "pending" && self.amount <= self.sender.balance
  #    binding.pry
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    else

    end
  end


end


# Transfer
#   initialize
#     can initialize a Transfer (FAILED - 1)
#     initializes with a sender (FAILED - 2)
#     initializes with a receiver (FAILED - 3)
#     always initializes with a status of 'pending' (FAILED - 4)
#     initializes with a transfer amount (FAILED - 5)
#   #valid?
#     can check that both accounts are valid (FAILED - 6)
#     calls on the sender and reciever's #valid? methods (FAILED - 7)
#   #execute_transaction
#     can execute a successful transaction between two accounts (FAILED - 8)
#     each transfer can only happen once (FAILED - 9)
#     rejects a transfer if the sender doesn't have a valid account (FAILED - 10)
#   #reverse_transfer
#     can reverse a transfer between two accounts (FAILED - 11)
#     it can only reverse executed transfers (FAILED - 12)


# We're going to build a BankAccount class where one instance of the class can transfer money to another instance through a
# Transfer class. The Transfer class acts as a space for a transaction between two instances of the bank account class. Think of
# it this way: you can't just transfer money to another account without the bank running checks first. Transfer instances will do
# all of this, as well as check the validity of the accounts before the transaction occurs. Transfer instances should be able to
# reject a transfer if the accounts aren't valid or if the sender doesn't have the money.
#
# Transfers start out in a "pending" status. They can be executed and go to a "complete" state. They can also go to a "rejected"
# status. A completed transfer can also be reversed and go into a "reversed" status.
