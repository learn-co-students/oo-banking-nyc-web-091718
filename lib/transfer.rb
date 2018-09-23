require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
    #binding.pry
  end

  def execute_transaction
    if sender.valid? && self.status == "pending" && sender.balance - self.amount > 0
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"

    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    #binding.pry
  end

#binding.pry

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  #binding.pry
  end



end

#binding.pry
