require 'geoip'

module SecurityGuard
  module Utils
    class GeoIps
      attr_accessor :ip_address

      VALID_IP_ADDRESS = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/

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

      def ip_address=(ip_address)
        @ip_address = ip_address.to_s[VALID_IP_ADDRESS]
      end
    end
  end
end