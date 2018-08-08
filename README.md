# Consumer

Simple gem to consumer json API by HTTP GET method

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'consumer'
```

And then execute:

    $ bundle
Or install it yourself as:

    $ gem install consumer

## Usage
##### Get info from url
```
user = Consumer.get("http://user.api.url")
puts user.name
puts user.purchases.first.date
# with hipermidia
puts user.link("rel_name").link
```
##### Using a hash
```
user = Consumer.build({name: 'name1', 'purchases': [{date: null}]})
puts user.name
puts user.purchases.first.date
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/consumer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
