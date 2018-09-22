class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance > amount
  end

  def execute_transaction
    if @status != "complete" && valid?
      @sender.withdraw(amount)
      @receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.withdraw(amount)
      @status = "reversed"
    end
  end

end
