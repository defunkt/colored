# frozen_string_literal: false

require 'colored2/codes'
require 'colored2/ascii_decorator'

module Colored2
  def self.decorate(a_class)
    a_class.send(:include, Colored2)
  end

  def self.included(from_class)
    from_class.class_eval do
      def surround_with_color(color: nil, effect: nil, color_self: nil, string: nil, &block)
        color_type = if Colored2.background_next? && effect.nil?
                       Colored2.foreground_next!
                       :background
                     else
                       :foreground
                     end

        opts = {}
        opts.merge!(color_type => color) if color
        opts.merge!(effect:) if effect

        if color_self
          opts.merge!( beginning: :on, end: :off)
          colored = Colored2::AsciiDecorator.new(self).decorate(opts)
          if string || block
            arg = "#{string}#{block&.call}"
            colored << Colored2::AsciiDecorator.new(arg).decorate(opts) if !arg.empty?
          end
        else
          opts.merge!( end: :on )
          colored = Colored2::AsciiDecorator.new(self).decorate(opts)
          if string || block
            arg = "#{string}#{block&.call}"
            colored << Colored2::AsciiDecorator.new(arg).decorate(opts.merge(end: :off)) if !arg.empty?
          end
        end
        colored
      end

      def on
        Colored2.background_next!
        self
      end
    end

    from_class.instance_eval do
      COLORS.each_key do |color|
        define_method(color) do |string = nil, &block|
          surround_with_color(color:, color_self: true, string:, &block)
        end

        define_method("#{color}!".to_sym) do |string = nil, &block|
          surround_with_color(color:, color_self: false, string:, &block)
        end
      end

      EFFECTS.each_key do |effect|
        next if effect == 'no_color'

        define_method(effect) do |string = nil, &block|
          surround_with_color(effect:, color_self: true, string:, &block)
        end

        define_method("#{effect}!".to_sym) do |string = nil, &block|
          surround_with_color(effect:, color_self: false, string:, &block)
        end
      end

      define_method(:to_eol) do
        tmp = sub(/^(\e\[[\[\e0-9;m]+m)/, "\\1\e[2K")
        if tmp == self
          return "\e[2K" << self
        end

        tmp
      end

      define_method(:to_bol) do
        "#{self}\033[#{length}D\033[0D"
      end
    end
  end
end

require 'colored2/strings'
