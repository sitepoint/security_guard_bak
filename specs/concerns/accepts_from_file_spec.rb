require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class TestAcceptsFromFile
  include SecurityGuard::Concerns::AcceptsFromFile
  accepts_from_file :attr1, :attr2
end

describe SecurityGuard::Concerns::AcceptsFromFile do
  before do
    @test = TestAcceptsFromFile.new
  end

  it 'has #attr1 as an accessor' do
    @test.attr1 = 'test1'
    @test.attr2 = 'test2'
    @test.attr1.must_equal 'test1'
    @test.attr2.must_equal 'test2'
  end

  it 'converts data from a file into an array' do
    @test.attr1_from_file = fixture_file('countries.txt')
    @test.attr1.must_equal ['Australia', 'United States', 'United Kingdom']
  end
end