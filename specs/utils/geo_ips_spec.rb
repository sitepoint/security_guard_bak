require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SecurityGuard::Utils::GeoIps do
  describe 'initialise without an ip' do
    before do
      @geoip = SecurityGuard::Utils::GeoIps.new(data_file('GeoIP.dat'))
    end

    it 'initialises with a geo ip database' do
      @geoip.must_be_instance_of SecurityGuard::Utils::GeoIps
    end

    it 'sets an ip address' do
      @geoip.ip_address = '8.8.8.8'
      @geoip.ip_address.must_equal '8.8.8.8'
    end
  end

  describe 'initialise with an ip' do
    before do
      @geoip = SecurityGuard::Utils::GeoIps.new(data_file('GeoIP.dat'), '8.8.8.8')
    end

    it 'has an ip address' do
      @geoip.ip_address.must_equal '8.8.8.8'
    end

    it 'detects the country' do
      @geoip.country.must_be_kind_of Struct
      @geoip.country.to_hash.must_equal({
        :request        => '8.8.8.8',
        :ip             => '8.8.8.8',
        :country_code   => 225,
        :country_code2  => 'US',
        :country_code3  => 'USA',
        :country_name   => 'United States',
        :continent_code => 'NA'
      })
    end

    it 'detects the country name' do
      @geoip.country_name.must_equal 'United States'
    end
  end
end