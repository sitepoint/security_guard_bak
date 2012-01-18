require 'geoip'

module SecurityGuard
  module Utils
    class GeoIps
      attr_accessor :ip_address

      def initialize(geo_data_file, ip_address = nil)
        @geoip ||= GeoIP.new(geo_data_file)
        self.ip_address = ip_address
      end

      def country
        @geoip.country(ip_address)
      end

      def country_name
        country.country_name
      end
    end
  end
end