# Yareq

This gem demonstrate how to query yandex search engine via http and parse results.

## Installation

Add this line to your application's Gemfile:

    gem 'yareq', github: 'Rustik/yareq'

    # dependencies -- because I didn't submit it into RubyGems I don't need to build it with it's dependencies
    gem 'curb'
    gem 'nokogiri'
    gem 'addressable'

And then execute:

    $ bundle
    $ bundle exec gem build yareq.gemspec
    $ yareq

## Usage

1. using command line: 
   type: yareq

2. inside your app:

require 'yareq'
y = Yareq::Request.new "ford", { lr: "2" }
puts y.process

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
