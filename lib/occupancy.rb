require_relative 'overlap'

class Occupancy
  def initialize(bookings, period)
    @bookings = bookings
    @period = period
  end

  def days_occupied
    occupied_days = 0
    while !bookings.empty? && occupied_days < period_days do
      booking = bookings.pop
      occupied_days += overlap(booking)
    end
    occupied_days
  end

  def period_days
    period.count
  end

  def days_available
    period_days - days_occupied
  end

  def percent
    Integer(days_occupied / Float(period_days) * 100)
  end

  private

  attr_accessor :bookings, :period

  def overlap(booking)
    Overlap.new(period, booking).call
  end
end