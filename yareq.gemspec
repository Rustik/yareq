# -*- encoding: utf-8 -*-
require File.expand_path('../lib/yareq/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rustam Galeev"]
  gem.email         = ["rustam.spb@gmail.com"]
  gem.description   = %q{This gem demonstrate how to query yandex search engine and parse results}
  gem.summary       = %q{Simple gem that send queries to yandex search engine}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "yareq"
  gem.require_paths = ["lib"]
  gem.version       = Yareq::VERSION

  gem.add_dependency(%q<curb>)
  gem.add_dependency(%q<nokogiri>)
  gem.add_dependency(%q<addressable>)
  gem.add_dependency(%q<webmock>)

end
