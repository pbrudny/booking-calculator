require 'date'
require 'pry'

class Occupancy
  def initialize(bookings, period)
    @bookings = bookings
    @period = period
  end

  def days
    occupied_days = 0
    while !bookings.empty? && occupied_days < period_days do
      booking = bookings.pop
      occupied_days += overlap(booking)
    end
    occupied_days
  end

  def overlap(booking)
    return 0 if Date.parse(booking[:end]) < period.first
    return 0 if Date.parse(booking[:start]) > period.last
    return period_days if Date.parse(booking[:start]) <= period.first && Date.parse(booking[:end]) >= period.last
  end

  def period_days
    period.count
  end

  def percent
    Integer(days / Float(period_days) * 100)
  end

  private

  attr_accessor :bookings, :period
end