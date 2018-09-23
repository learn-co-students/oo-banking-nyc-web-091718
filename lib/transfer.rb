class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

   def initialize(sender, receiver, amount)
     @sender = sender
     @receiver = receiver
     @status = "pending"
     @amount = amount
   end

   def valid?
     sender.valid? && receiver.valid? ? true : false
   end

   def execute_transaction
     if valid? && sender.balance > amount && self.status == "pending"
       receiver.deposit(amount)
       sender.balance -= amount
       self.status = "complete"
     else
       self.status = "rejected"
       "Transaction rejected. Please check your account balance."
     end
   end

   def reverse_transfer
     if valid? && receiver.balance > amount && self.status == "complete"
       sender.deposit(amount)
       receiver.balance -= amount
       self.status = "reversed"
     else
       self.status = "rejected"
       "Transaction rejected. Please check your account balance."
     end
   end

end
