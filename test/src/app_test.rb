require_relative '../test_helper'
require 'app'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

# This class is test.
class HelloWorldTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_hello_world
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World', last_response.body
  end
end
