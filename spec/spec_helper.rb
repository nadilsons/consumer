$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'consumer'
require 'fakeweb'
require 'json'
require 'rspec/its'
require 'byebug'

RSpec.configure do |config|

  def register_uri(method, uri, options = {})
    options.merge!(:content_type => "application/json; charset=utf-8") if options[:content_type].nil?
    FakeWeb.register_uri(method, uri, options)
  end

end
