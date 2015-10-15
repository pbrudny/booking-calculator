require_relative 'test_helper'
require_relative '../lib/occupancy_report'

describe BookingCalculator::OccupancyReport do
  describe 'when initialized with json' do
    before do
      bookings_path = File.expand_path('../fixtures/bookings.json', __FILE__)
      @report = BookingCalculator::OccupancyReport.new(bookings_path, '2015-06-01', '2015-07-01')
    end

    describe '#display_output' do
      it 'returns right percent of occupancy' do
        @report.display_output.must_match /Percent of occupancy: 67/
      end

      it 'returns right number of occupied nights' do
        @report.display_output.must_match /Nights occupied: 21/
      end

      it 'returns right number of nights available' do
        @report.display_output.must_match /Nights available: 10/
      end
    end
  end
end