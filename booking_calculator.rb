require_relative 'lib/occupancy'

report = OccupancyReport.new(ARGV[0], ARGV[1], ARGV[2])
report.display_output