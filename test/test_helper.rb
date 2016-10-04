ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require 'simplecov'

$LOAD_PATH.push(File.expand_path(File.dirname(File.dirname(__FILE__)))+"/src")

if ENV["COVERAGE"]
  SimpleCov.start do
    add_filter "/test/"
    SimpleCov.command_name "MiniTest #{Time.now}"
  end
end
