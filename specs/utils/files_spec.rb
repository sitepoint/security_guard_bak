require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SecurityGuard::Utils::Files do
  describe 'SecurityGuard::Utils::Files#load' do
    it 'points to the correct file' do
      SecurityGuard::Utils::Files.load('GeoIP.dat').must_match 'security_guard/data/GeoIP.dat'
    end
  end

  describe 'SecurityGuard::Utils::Files#to_array' do
    it 'returns an array of the line delimited data' do
      SecurityGuard::Utils::Files.to_array(fixture_file('countries.txt')).must_equal ['Australia', 'United States', 'United Kingdom']
    end
  end
end