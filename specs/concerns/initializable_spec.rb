require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class TestInitializableWithInitializer
  include SecurityGuard::Concerns::Initializable
  initializable :attr1, :attr2
  def initialize(args = nil)
    initializable_attrs args
  end
end

class TestInitializableWithoutInitializer
  include SecurityGuard::Concerns::Initializable
  initializable :attr1, :attr2
end

describe SecurityGuard::Concerns::Initializable do
  [TestInitializableWithInitializer, TestInitializableWithoutInitializer].each do |klass|
    it "#{klass}: initialises with some attributes" do
      test = klass.new :attr1 => 'test1', :attr2 => 'test2'
      test.attr1.must_equal 'test1'
      test.attr2.must_equal 'test2'
    end
  end

  it 'without any initialiser arguments' do
    test = TestInitializableWithInitializer.new
    test.attr1 = 'test1'
    test.attr2 = 'test2'
    test.attr1.must_equal 'test1'
    test.attr2.must_equal 'test2'
  end
end