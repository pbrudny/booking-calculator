require 'date'

module BookingCalculator
  class Overlap
    def initialize(period, booking)
      self.period = period
      self.booking = booking
    end

    def call
      return 0 if booking_before_period?
      return 0 if booking_after_period?
      return period.count if booking_overlaps_period?
      days_overlap
    end

    private

    attr_accessor :period, :booking

    def booking_before_period?
      end_day < period.first
    end

    def booking_after_period?
      start_day > period.last
    end

    def booking_overlaps_period?
      start_day <= period.first && end_day >= period.last
    end

    def days_overlap
      Integer(end_pointer - start_pointer)
    end

    def start_pointer
      start_day <= period.first ? period.first : start_day
    end

    def end_pointer
      end_day <= period.last ? end_day : period.last
    end

    def start_day
      Date.parse(booking['start'])
    end

    def end_day
      Date.parse(booking['end'])
    end
  end
end
