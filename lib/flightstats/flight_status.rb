module FlightStats
  class FlightStatus < Resource
    attr_accessor :flight_id,
                  :carrier_fs_code,
                  :flight_number,
                  :departure_airport_fs_code,
                  :arrival_airport_fs_code,
                  :departure_date,
                  :arrival_date,
                  :status,
                  :schedule,
                  :operational_times,
                  :codeshares,
                  :flight_durations,
                  :airport_resources,
                  :flight_equipment

    @@base_path = "/flex/flightstatus/rest/v2/json"

    class << self
      def by_flight_id(flight_id, options = {})
        from_response API.get("#{base_path}/flight/status/#{flight_id}", {}, options), 'flightStatus'
      end

      def departing_on(carrier, flight_number, year, month, day, options = {})
        from_response API.get("#{base_path}/flight/status/#{carrier}/#{flight_number}/dep/#{year}/#{month}/#{day}", {}, options), 'flightStatuses'
      end

      def departing_on_from_airport(carrier, flight_number, year, month, day, airport_code)
        from_response API.get("#{base_path}/flight/status/#{carrier}/#{flight_number}/dep/#{year}/#{month}/#{day}", {}, "airport=#{airport_code}"), 'flightStatuses'
      end

      def arriving_on(carrier, flight_number, year, month, day, options = {})
        from_response API.get("#{base_path}/flight/status/#{carrier}/#{flight_number}/arr/#{year}/#{month}/#{day}", {}, options), 'flightStatuses'
      end

      def track_by_flight_id(flight_id, options = {})
        from_response API.get("#{base_path}/flight/track/#{flight_id}", {}, options), 'flightTrack'
      end

      def track_arriving_on(carrier, flight_number, year, month, day, options = {})
        from_response API.get("#{base_path}/flight/tracks/#{carrier}/#{flight_number}/arr/#{year}/#{month}/#{day}", {}, options), 'flightTracks'
      end

      def track_departing_on(carrier, flight_number, year, month, day, options = {})
        from_response API.get("#{base_path}/flight/tracks/#{carrier}/#{flight_number}/dep/#{year}/#{month}/#{day}", {}, options), 'flightTracks'
      end

      def base_path
        @@base_path
      end
    end
  end
end