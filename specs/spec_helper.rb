require 'simplecov'
SimpleCov.start

require 'turn'
require 'minitest/autorun'
require 'minitest/spec'

require File.expand_path('../../lib/security_guard', __FILE__)

def data_file(filename)
  SecurityGuard::Utils::Files.load(filename)
end

def fixture_file(filename)
  File.expand_path("../fixtures/#{filename}", __FILE__)
end