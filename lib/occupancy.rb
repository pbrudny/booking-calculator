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
      occupied_days += overlap(Date.parse(booking[:start]), Date.parse(booking[:end]))
    end
    occupied_days
  end

  def overlap(start_day, end_day)
    return 0 if end_day < period.first
    return 0 if start_day > period.last
    return period_days if start_day <= period.first && end_day >= period.last
    pointer_start = (start_day <= period.first ? period.first : start_day)
    pointer_end = (end_day <= period.last ? end_day : period.last)
    pointer_end - pointer_start
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