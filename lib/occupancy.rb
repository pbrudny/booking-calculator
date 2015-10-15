require_relative 'overlap'

module BookingCalculator
  class Occupancy
    def initialize(bookings, period)
      self.bookings = bookings
      self.period = period
    end

    def days_occupied
      @occupied_days ||= count_occupied
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
      BookingCalculator::Overlap.new(period, booking).call
    end

    def period_days
      period.count
    end

    def count_occupied
      occupied_days = 0
      while !bookings.empty? && occupied_days < period_days
        occupied_days += overlap(bookings.pop)
      end
      occupied_days
    end
  end
end
