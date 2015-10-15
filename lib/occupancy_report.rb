require 'json'
require_relative '../lib/occupancy'

module BookingCalculator
  class OccupancyReport
    def initialize(bookings_path, start_date, end_date)
      self.bookings_path = bookings_path
      self.start_date = start_date
      self.end_date = end_date
    end

    def output
      "Percent of occupancy: #{occupancy_percent}\n"\
      "Nights available: #{nights_available}\n"\
      "Nights occupied: #{nights_occupied}"
    end

    def occupancy_percent
      occupancy.percent
    end

    def nights_available
      occupancy.days_available
    end

    def nights_occupied
      occupancy.days_occupied
    end

    private

    attr_accessor :bookings_path, :start_date, :end_date

    def bookings
      @bookings ||= JSON.parse(File.read(bookings_path))['bookings']
    end

    def period
      Date.parse(start_date)..Date.parse(end_date)
    end

    def occupancy
      @occupancy ||= BookingCalculator::Occupancy.new(bookings, period)
    end
  end
end
