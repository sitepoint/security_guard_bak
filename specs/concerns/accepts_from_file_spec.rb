require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class TestA
  include SecurityGuard::Concerns::AcceptsFromFile
  accepts_from_file :test_attribute
end

describe SecurityGuard::Concerns::AcceptsFromFile do
  before do
    @test = TestA.new
  end

  it 'has #test_attribute as an accessor' do
    @test.test_attribute = 'test'
    @test.test_attribute.must_equal 'test'
  end

  it 'converts data from a file into an array' do
    @test.test_attribute_from_file = fixture_file('countries.txt')
    @test.test_attribute.must_equal ['Australia', 'United States', 'United Kingdom']
  end
end