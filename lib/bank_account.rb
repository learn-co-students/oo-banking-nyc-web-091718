require 'pry'

class BankAccount

attr_reader :name
attr_accessor :balance, :status

@@all = []

#### Class Methods
  def self.all
    @@all
  end

  #### Instance Methods

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status


    @@all << self
  end


  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0

  end

  def close_account
    self.status = "closed"
  end




end ### End of BankAccount Class
