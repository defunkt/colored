require_relative 'constants'
require 'forwardable'

module Colored2
  def self.enable!
    Colored2::AsciiDecorator.enable!
  end
  def self.disable!
    Colored2::AsciiDecorator.disable!
  end
  def self.background_next!
    Colored2::AsciiDecorator.background_next!
  end
  def self.foreground_next!
    Colored2::AsciiDecorator.foreground_next!
  end
  def self.background_next?
    Colored2::AsciiDecorator.background_next?
  end

  class AsciiDecorator
    @__background_next = false
    @__colors_disabled = false
    class << self
      attr_accessor :__background_next, :__colors_disabled
      def enable!
        self.__colors_disabled = false
      end
      def enabled?
        !self.__colors_disabled
      end
      def disable!
        self.__colors_disabled = true
      end
      def background_next!
        self.__background_next = true
      end
      def foreground_next!
        self.__background_next = false
      end
      def background_next?
        self.__background_next
      end

      def clear
        effect(:clear)
      end

      def colors
        @colors ||= COLORS.keys.sort
      end

      def effect(effect_name)
        "\e[#{EFFECTS[effect_name]}m" if effect_name && EFFECTS[effect_name.to_sym]
      end

      def color(color_name:, type:)
        background_code = (type == :background) ? 10 : 0
        if color_name && COLORS[color_name.to_sym]
          "\e[#{COLORS[color_name.to_sym] + background_code}m"
        end
      end
    end

    extend Forwardable
    def_delegators :@my_class, :enable!, :disable!, :clear, :colors, :effect, :color

    attr_accessor :string, :my_class

    def initialize(a_string)
      self.string = a_string.instance_of?(Object) ? '' : a_string.to_s
      self.my_class = self.class
    end

    # options[:start] = :color
    # options[:end]   = :color | :clear
    def decorate(options = {})

      return string if !self.class.enabled? || string.length == 0
      escape_sequence = [
        color(color_name: options[:foreground], type: :foreground),
        color(color_name: options[:background], type: :background),
        effect(options[:effect])
      ].compact.join

      colored = ''
      colored << escape_sequence if options[:beginning] == :on
      colored << string
      if options[:end]
        colored << clear if options[:end] == :off && !colored.end_with?(clear)
        colored << escape_sequence if options[:end] == :on
      end
      colored
    end

    def un_decorate
      string.gsub(%r{\e\[\d+(;\d+)*m}, '')
    end

  end
end
