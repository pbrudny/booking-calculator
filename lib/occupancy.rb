require 'date'

class Occupancy
  def initialize(bookings, period)
    @bookings = bookings
    @period = period
  end

  def call

  end

  def days

  end

  def period_days
    period.count
  end

  def percent

  end
  private

  attr_accessor :bookings, :period
end