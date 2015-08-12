require "consumer/version"
require "consumer/proxy"
require 'open-uri'
require 'json'

module Consumer

  def self.get(url)
    json = open(url).read
    hash = JSON.parse(json)

    build(hash)
  end

  def self.build(hash)
    hash.is_a?(Array) ?
      hash.map { |h| Consumer::Proxy.new(h)} :
      Consumer::Proxy.new(hash)
  end
end
