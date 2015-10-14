require_relative 'test_helper'
require_relative '../lib/occupancy'

describe Occupancy do
  describe 'when initialized with bookings and period' do
    before do
      bookings = []
      period = Date.new(2015,11,23)..Date.new(2015,12,22)
      @occupancy = Occupancy.new(bookings, period)
    end

    describe '#call' do
      it { @occupancy.call.must_equal 0 }
    end
  end
end
