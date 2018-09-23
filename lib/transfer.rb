class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status 
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 
  
  def valid? 
    if @sender.valid? && @receiver.valid? == true 
      return true 
    else 
      false 
    end 
  end 
  
  def execute_transaction
    if  @sender.valid? && self.status == "pending" && sender.balance - self.amount > 0 
      sender.balance -= self.amount 
      receiver.balance += self.amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount 
    @status = "reversed"
  end 
end 
  
end
