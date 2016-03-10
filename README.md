[![Gem Version](https://badge.fury.io/rb/colored2.svg)](https://badge.fury.io/rb/colored2)
[![Build Status](https://travis-ci.org/kigster/colored2.svg?branch=master)](https://travis-ci.org/kigster/colored2)
[![Code Climate](https://codeclimate.com/repos/56dff58d80b254164b003d80/badges/176e4c39b20bfed90478/gpa.svg)](https://codeclimate.com/repos/56dff58d80b254164b003d80/feed)
[![Test Coverage](https://codeclimate.com/repos/56dff58d80b254164b003d80/badges/176e4c39b20bfed90478/coverage.svg)](https://codeclimate.com/repos/56dff58d80b254164b003d80/coverage)
[![Issue Count](https://codeclimate.com/repos/56dff58d80b254164b003d80/badges/176e4c39b20bfed90478/issue_count.svg)](https://codeclimate.com/repos/56dff58d80b254164b003d80/feed)

## Colored2

This is a fork of Chris (defunkt) Wanstrath's colored gem, which appears to be no longer supported.

This fork comes with a slightly spruced up syntax and rspecs.

## Usage

In addition to the simple syntax of the original gem, which affected only the string to the left of the method call, 
the "bang" syntax affects a string to the right. If the block or a method argument is provided,
the contents is wrapped in the color, and the color is then reset back. If no block
or argument is provided, the color is left open-ended, and must be explicitly reset – when using the 'bang' notation.

![](doc/colored2-session1.png)

## Usage in Other Classes

You can decorate and color not just strings. 

To color numbers, require the following file, which automatically decorates `Fixnum` and `Float`.  You can also add color methods 
to the `Object`. Finally, you can add the methods to any custom class by including the `Colored2` Module.

Below is an `IRB` session that shows a slightly more advanced usage.

![](doc/colored2-session2.png)
