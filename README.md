[![Gem Version](https://badge.fury.io/rb/colored2.svg)](https://badge.fury.io/rb/colored2)
[![Build Status](https://travis-ci.org/kigster/colored2.svg?branch=master)](https://travis-ci.org/kigster/colored2)
[![Code Climate](https://codeclimate.com/github/kigster/colored2/badges/gpa.svg)](https://codeclimate.com/github/kigster/colored2)
[![Test Coverage](https://codeclimate.com/github/kigster/colored2/badges/coverage.svg)](https://codeclimate.com/github/kigster/colored2/coverage)
[![Issue Count](https://codeclimate.com/github/kigster/colored2/badges/issue_count.svg)](https://codeclimate.com/github/kigster/colored2)

## Colored2

This is a fork of Chris (defunkt) Wanstrath's colored gem, which appears to be no longer supported.

This fork comes with a slightly spruced up syntax and rspecs.


## Usage

```ruby
require 'colored2'

puts 'this is red'.red
puts 'this is red with a yellow background'.red.on.yellow
puts 'this is red with and italic'.red.italic
puts 'this is green bold'.green.bold << ' and regular'.green 
puts 'this is really bold blue on white but reversed'.bold.blue.on.white.reversed
```

Unlike the previous syntax, which affects only the string to the left, the "bang" 
syntax affects a string to the right. If the block or a method argument is provided,
the contents is wrapped in the color, and the color is then reset back. If no block
or argument is provided, the color is left open-ended, and must be explicitly reset.

```ruby
puts 'this is regular, but '.red! << 'this is red '.yellow! << ' and yellow.'.clear!
puts ('this is regular, but '.red! do
  'this is red '.yellow! do
    ' and yellow.'.clear!
  end
end)
```

This is what you should see, when applying the above examples.

![](doc/colored2.png)
