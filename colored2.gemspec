# frozen_string_literal: false

lib = File.expand_path('lib', __dir__)
$:.unshift lib unless $:.include?(lib)
require 'colored2/version'

Gem::Specification.new do |s|
  s.name              = 'colored2'
  s.version           = Colored2::VERSION
  s.license           = 'MIT'
  s.summary           = 'Add even more color to your life.'
  s.homepage          = 'http://github.com/kigster/colored2'
  s.email             = 'kigster@gmail.com'
  s.authors           = ['Chris Wanstrath', 'Konstantin Gredeskoul']
  s.require_path      = 'lib'
  s.files             = %w(README.md Rakefile LICENSE)
  s.files            += Dir.glob('lib/**/*')

  s.required_ruby_version = ">= 3.1"

  s.description = <<~DESC
    This is a heavily modified fork of http://github.com/defunkt/colored gem, with many
    sensible pull requests combined. Since the authors of the original gem no longer support it,
    this might, perhaps, be considered a good alternative.

    Simple gem that adds various color methods to String class, and can be used as follows:

      require 'colored2'

      puts 'this is red'.red
      puts 'this is red with a yellow background'.red.on.yellow
      puts 'this is red with and italic'.red.italic
      puts 'this is green bold'.green.bold << ' and regular'.green
      puts 'this is really bold blue on white but reversed'.bold.blue.on.white.reversed
      puts 'this is regular, but '.red! << 'this is red '.yellow! << ' and yellow.'.no_color!
      puts ('this is regular, but '.red! do
        'this is red '.yellow! do
          ' and yellow.'.no_color!
        end
      end)

  DESC
  s.metadata['rubygems_mfa_required'] = 'true'
end
