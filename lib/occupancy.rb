require 'date'

class Occupancy
  def initialize(bookings, period)
    @bookings = bookings
    @period = period
  end

  def call

  end

  private

  attr_accessor :bookings, :period
end