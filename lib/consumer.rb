require "consumer/version"
require "consumer/proxy"
require 'open-uri'
require 'json'

module Consumer

  def self.get(url)
    json = open(url).read
    hash = JSON.parse(json)
    Consumer::Proxy.new(hash)
  end

end
