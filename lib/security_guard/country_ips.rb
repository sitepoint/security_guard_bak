module SecurityGuard
  class CountryIps
    include Concerns::AcceptsFromFile
    include Concerns::Initializable

    accepts_from_file :countries, :ips
    initializable     :countries, :ips

    def initialize(args = nil)
      @geoip ||= Utils::GeoIps.new(Utils::Files.load('GeoIP.dat'))
      initializable_attrs args
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