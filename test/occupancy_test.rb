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

    describe '#days_occupied' do
      it { @occupancy.days_occupied.must_equal 0 }
    end

    describe '#percent' do
      it { @occupancy.percent.must_equal 0 }
    end
  end

  describe 'when bookings before and after given period' do
    before do
      bookings = [{start: '2015-05-02', end: '2015-05-30'}, {start: '2015-06-23', end: '2015-06-30'}]
      @occupancy = Occupancy.new(bookings, @period)
    end

    describe '#days_occupied' do
      it { @occupancy.days_occupied.must_equal 0 }
    end

    describe '#percent' do
      it { @occupancy.percent.must_equal 0 }
    end
  end

  describe 'when booking overlaps whole period' do
    before do
      bookings = [{start: '2015-05-14', end: '2015-06-22'}]
      @occupancy = Occupancy.new(bookings, @period)
    end

    describe '#days_occupied' do
      it { @occupancy.days_occupied.must_equal 22 }
    end

    describe '#percent' do
      it { @occupancy.percent.must_equal 100 }
    end
  end

  describe 'when one booking' do
    before do
      bookings = [{start: '2015-06-02', end: '2015-06-15'}]
      @occupancy = Occupancy.new(bookings, @period)
    end

    describe '#days_occupied' do
      it { @occupancy.days_occupied.must_equal 13 }
    end

    describe '#percent' do
      it { @occupancy.percent.must_equal 59 }
    end
  end

  describe 'when multiple bookings' do
    before do
      bookings = [
        {start: '2015-05-20', end: '2015-06-02'},
        {start: '2015-06-04', end: '2015-06-05'},
        {start: '2015-06-07', end: '2015-06-15'},
        {start: '2015-06-21', end: '2015-06-27'},
      ]
      @occupancy = Occupancy.new(bookings, @period)
    end

    describe '#days_occupied' do
      it { @occupancy.days_occupied.must_equal 11 }
    end

    describe '#percent' do
      it { @occupancy.percent.must_equal 50 }
    end
  end
end
