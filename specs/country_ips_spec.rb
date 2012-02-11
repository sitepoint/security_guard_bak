require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe SecurityGuard::CountryIps do
  let(:country_ips) do
    SecurityGuard::CountryIps.new(
      :countries => ['Australia'],
      :ips       => ['4.4.4.4', '8.8.8.8', '203.206.0.1']
    )
  end

  it 'contains GeoIP data' do
    country_ips.instance_variable_get(:@geoip).must_be_instance_of SecurityGuard::Utils::GeoIps
  end

  it 'returns all IPs from the given country and IP dictionaries' do
    country_ips.result.must_equal ['203.206.0.1']
  end
end