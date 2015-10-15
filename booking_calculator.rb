require_relative 'lib/occupancy_report'

report = BookingCalculator::OccupancyReport.new(ARGV[0], ARGV[1], ARGV[2])
puts report.output
