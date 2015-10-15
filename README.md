This is a simple application providing calculation for booking systems
### Setup

```
  $ bundle install
```

### Running
```
  $ ruby booking_calculator.rb [json file with bookings] [start date] [end date]
```

Example:

```
  $ ruby booking_calculator.rb 'test/fixtures/bookings.json' '2015-06-01' '2015-06-22'
```
### Testing

You can test it using Minitest.

```
  $ ruby test/occupancy_test.rb
  $ ruby test/occupancy_report_test.rb
```
### Copyright

Copyright (c) 2015 Piotr Brudny.