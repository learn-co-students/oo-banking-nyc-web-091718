require 'pry'

class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"

  end

  def deposit(mo_money)
    @balance += mo_money
  end

  def withdraw(less_money)
    @balance -= less_money
  end

  def display_balance

  "Your balance is $#{@balance}."

  end

  def valid?
    if @balance > 0 && @status == "open"

      true
  else
      false
    end
  end

  def close_account
    @status = "closed"

  end

end
