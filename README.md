flightstats-flex
================

Ruby client for the FlightStats Flex API.

## Installation

In your Gemfile:

```ruby
gem "flightstats-flex", "~> 0.3.0"
```

or

```ruby
gem 'flightstats-flex', :git => 'https://github.com/diditclear/flightstats-client-ruby'
```

Note that there is an old **flightstats** gem on [Rubygems](http://rubygems.org/gems/flightstats), hence the name **flightstats-flex** for this library.

## Usage

You only need to configure your FlightStats app id and keys:

```ruby
FlightStats.app_id = '1234'
FlightStats.app_key = '5678'
```

You can also specify your own logger:

```ruby
FlightStats.logger = Logger.new
```

When using Rails, you can set it up in an initializer (e.g. config/initializers/flightstats.rb):

```ruby
require 'flightstats'

FlightStats.app_id = '1234'
FlightStats.app_key = '5678'
FlightStats.logger = Rails.logger
```

### Extended options

The last argument of each API call is an optional hash. The `:params` key of that hash is used to pass query parameters.

For extended options, it looks like:

```
FlightStats::Airport.actives({ :params => { :extendedOptions => 'languageCode:fr' } })
FlightStats::Airport.actives({ :params => { :extendedOptions => 'useHTTPErrors+languageCode:fr' } })
```

## Supported APIs

### Airlines

#### Active airlines
```ruby
airlines = FlightStatus::Airline.actives
```

#### Active airlines for date
```ruby
airlines = FlightStats::Airline.actives_for_date 2014, 10, 10
```

#### All airlines (active or inactive)
```ruby
airlines = FlightStats::all
```

### Airports

#### Active airports

```ruby
airports = FlightStats::Airport.actives
```

#### Active airports for date

```ruby
airports = FlightStats::Airport.actives_for_date 2013, 5, 1
```

#### All airports (active and inactive)

```ruby
airports = FlightStats::Airport.all
```

#### Current airport by code (code type chosen via precedence order)

```ruby
airports = FlightStats::Airport.current 'PDX'
```

#### Airport on date by code

```ruby
airports = FlightStats::Airport.on_date 'PDX', 2013, 5, 1
```

#### Airports by city code

```ruby
airports = FlightStats::Airport.by_city_code 'ABC'
```

#### Airports by country code

```ruby
airports = FlightStats::Airport.by_country_code 'GB'
```

#### Airport by FlightStats code

```ruby
airport = FlightStats::Airport.by_flight_stats_code 'PDX'
```

#### Airports by IATA code

```ruby
airports = FlightStats::Airport.by_iata_code 'PDX'
```

#### Airport by IATA code on date

```ruby
airport = FlightStats::Airport.by_iata_code_on_date 'PDX', 2013, 5, 1
```

#### Airports by ICAO code

```ruby
airports = FlightStats::Airport.by_icao_code 'KPDX'
```

#### Airport by ICAO code on date

```ruby
airport = FlightStats::Airport.by_icao_code_on_date 'KPDX', 2013, 5, 1
```

#### Airports within radius of location

```ruby
airports = FlightStats::Airport.within_radius 17, 39, 150
airports.size # => 9
airports[5].name # => "Papola Casale Airport"
```

### Flight Status & Track by Flight

#### Flight Status (by flight ID)

```ruby
flight_status = FlightStats::FlightStatus.by_flight_id 1234
```

#### Flight status (flights departing on date)

```ruby
flight_statuses = FlightStats::FlightStatus.departing_on 'UA', 901, 2013, 5, 1
```

#### Flight status (flights arriving on date)

```ruby
flight_statuses = FlightStats::FlightStatus.arriving_on 'UA', 901, 2013, 5, 1
```

#### Flight track (by flight ID)

```ruby
flight_track = FlightStats::FlightStatus.track_by_flight_id 1234
```

#### Flight tracks arriving on date (starting from specified hour of day)

```ruby
flight_tracks = FlightStats::FlightStatus.track_arriving_on 'UA', 901, 2013, 5, 1
```

#### Flight tracks departing on date (starting from specified hour of day)

```ruby
flight_tracks = FlightStats::FlightStatus.track_departing_on 'UA', 901, 2013, 5, 1
```


### Schedules/Connections

#### Direct scheduled flights by arrival location and date

```ruby
flights = FlightStats::Flight.direct_arriving_at 'EWR', 2013, 5, 1
```

#### Direct scheduled flights by departure location and departure date

```ruby
flights = FlightStats::Flight.direct_departing_from 'EWR', 2013, 5, 1
```

#### Direct scheduled flights by carrier, flight number, and arrival date(s)

```ruby
flights = FlightStats::Flight.direct_arriving_by_flight_number 'UA', 901, 2013, 5, 1
```

#### Direct scheduled flights by carrier, flight number, arrival location and arrival date(s)

```ruby
flights = FlightStats::Flight.direct_arriving_by_flight_number_and_location 'UA', 901, 'FRA', 2013, 5, 1
```

#### Direct scheduled flights by carrier, flight number, and departure date(s)

```ruby
flights = FlightStats::Flight.direct_arriving_by_flight_number 'UA', 901, 2013, 5, 1
```

#### Direct scheduled flights by carrier, flight number, departure location and departure date(s)

```ruby
flights = FlightStats::Flight.direct_arriving_by_flight_number_and_location 'UA', 901, 'FRA', 2013, 5, 1
```

####  Direct and connecting scheduled flights between two locations by arrival date

```ruby
flights = FlightStats::Flight.direct_and_connecting_arriving 'SFO', 'FRA', 2013, 5, 1
```

####  Direct and connecting scheduled flights between two locations by departure date

```ruby
flights = FlightStats::Flight.direct_and_connecting_departing 'SFO', 'FRA', 2013, 5, 1
```


## Contributing

There are two sets of tests.

The default one uses mock HTTP calls and can be run via:
```bash
rake test:spec
```

The remote ones will issue HTTP calls to FlightStats. You need to update your API credentials in spec/spec_helper.rb before running them:

```bash
rake test:remote:spec
```

## License

(The MIT License.)

© 2013 DidItClear

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
