module FlightStats
  class Airline < Resource
    attr_accessor :fs,
                  :iata,
                  :icao,
                  :name,
                  :phone_number,
                  :active

    @@base_path = "/flex/airlines/rest/v1/json"

    class << self
      def actives(options = {})
        from_response API.get("#{base_path}/active", {}, options), 'airlines'
      end

      def actives_for_date(year, month, day, options = {})
        from_response API.get("#{base_path}/active/#{year}/#{month}/#{day}", {}, options), 'airlines'
      end

      def all(options = {})
        from_response API.get("#{base_path}/all", {}, options), 'airlines'
      end

      def base_path
        @@base_path
      end

      def by_iata_code(iata_code, options = {})
        from_response API.get("#{base_path}/iata/#{iata_code}", {}, options), 'airlines'
      end
    end
  end
end
