require_relative 'test_helper'
require_relative '../lib/occupancy'

describe Occupancy do
  before do
    @period = Date.parse('2015-06-01')..Date.parse('2015-06-22')
  end

  describe 'when no bookings' do
    before do
      bookings = []
      @occupancy = Occupancy.new(bookings, @period)
    end

    describe '#days' do
      it { @occupancy.days.must_equal 0 }
    end

    describe '#percent' do
      it { @occupancy.percent.must_equal 0 }
    end
  end

  describe 'when one booking' do
    before do
      bookings = [{start: '2015-06-02', end: '2015-06-15'}]
      @occupancy = Occupancy.new(bookings, @period)
    end

    describe '#days' do
      it { @occupancy.days.must_equal 13 }
    end

    describe '#percent' do
      it { @occupancy.percent.must_equal 59 }
    end
  end

  describe 'when multiple booking' do
    before do
      bookings = [{start: '2015-06-01', end: '2015-06-15'}, {start: '2015-06-21', end: '2015-06-27'}]
      @occupancy = Occupancy.new(bookings, @period)
    end

    describe '#days' do
      it { @occupancy.days.must_equal 15 }
    end

    describe '#percent' do
      it { @occupancy.percent.must_equal 68 }
    end
  end
end
