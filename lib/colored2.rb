require 'colored2/constants'
require 'colored2/pencil'

module Colored2
  def self.included(klazz)
    klazz.class_eval do
      def tack_on_color(color, surround: true)
        if self.__background_next
          self.__background_next = nil
          Colored2::Pencil.saturate(self, background: color, surround: surround)
        else
          Colored2::Pencil.saturate(self, foreground: color, surround: surround)
        end
      end
    end

    klazz.instance_eval do
      define_method(:on) do
        self.__background_next = true
        self
      end

      attr_accessor :__background_next

      COLORS.each do |color, value|

        define_method(color) do |string = nil, &block|
          colored = tack_on_color(color, surround: true)
          colored << string if string
          colored << block.call if block
          colored
        end


        define_method("#{color}!".to_sym) do |string = nil, &block|
          colored = tack_on_color(color, surround: false)
          colored << string if string
          colored << block.call if block
          colored << Colored2::Pencil.clear if (string || block) && !colored.end_with?(Colored2::Pencil.clear)
          colored
        end

        define_method("on_#{color}") do
          Colored2::Pencil.saturate(self, background: color, surround: true)
        end

        COLORS.each do |highlight, value|
          next if color == highlight
          define_method("#{color}_on_#{highlight}") do
            Colored2::Pencil.saturate(self, foreground: color, background: highlight)
          end
        end
      end

      EFFECTS.each do |effect, value|
        next if effect == 'clear'
        define_method(effect) do
          Colored2::Pencil.saturate(self, effect: effect, surround: true)
        end

        define_method("#{effect}!".to_sym) do |string = nil, &block|
          colored = Colored2::Pencil.saturate(self, effect: effect, surround: false)
          colored << string if string
          colored << block.call if block
          colored << Colored2::Pencil.clear if (string || block) && !colored.end_with?(Colored2::Pencil.clear)
          colored
        end
      end

      define_method(:to_eol) do
        tmp = sub(/^(\e\[[\[\e0-9;m]+m)/, "\\1\e[2K")
        if tmp == self
          return "\e[2K" << self
        end
        tmp
      end
    end
  end
end
String.send(:include, Colored2)
