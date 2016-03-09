# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'colored2/version'

Gem::Specification.new do |s|
  s.name              = 'colored2'
  s.version           = Colored2::VERSION
  s.license           = 'MIT'
  s.summary           = 'Add even more color to your life.'
  s.homepage          = 'http://github.com/kigster/colored'
  s.email             = 'kig@reinvent.one'
  s.authors           = ['Konstantin Gredeskoul']
  s.has_rdoc          = false
  s.require_path      = 'lib'
  s.files             = %w(README Rakefile LICENSE )
  s.files            += Dir.glob('lib/**/*')
  s.files            += Dir.glob('spec/**/*')
  s.test_files        = Dir.glob('spec/**/*')

  s.required_ruby_version     = '>= 2.0.0'
  s.required_rubygems_version = '>= 1.3.6'

  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.4'

  s.description       = <<-desc
This is a heavily modified fork of http://github.com/defunkt/colored gem, with many
sensible pull requests combined. Since the authors of the original gem no longer support it,
this might, perhaps, be considered a good alternative.

Simple gem that adds various color methods to String class, and can be used as follows:

  require 'colored'

  'this is red'.red
  'this is red with a blue background (read: ugly)'.red_on_blue
  'this is red with an underlined'.red.underlined
  'this is really bold and really blue'.bold.blue
  Color.red 'This is red'

  red do
      First few words are red, '
     green { 'and then green '}

  desc
end
