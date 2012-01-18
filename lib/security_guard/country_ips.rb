module SecurityGuard
  class CountryIps
    include Utils::AcceptsFromFile

    accepts_from_file :countries, :ips

    def initialize
      @geoip ||= Utils::GeoIps.new(Utils::Files.load('GeoIP.dat'))
    end

    def result
      country_ips = []
      ips.each do |ip|
        @geoip.ip_address = ip
        country_ips << ip if countries.include?(@geoip.country_name)
      end
      country_ips.sort
    end
  end
end