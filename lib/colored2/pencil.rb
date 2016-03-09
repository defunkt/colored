require_relative 'constants'
module Colored2
  class Pencil
    class << self
      @colored_enabled = true

      def enable
        @colored_enabled = true
      end

      def disable
        @colored_enabled = false
      end

      def saturate(string, options = {})
        escape_sequence = [color(options[:foreground]), color("on_#{options[:background]}"), effect(options[:effect])].compact * ''
        colored = ''
        if options[:surround]
          colored << escape_sequence
          colored << string
          colored << clear unless colored.end_with?(clear)
        else
          colored << string
          colored << escape_sequence
        end
        colored
      end

      def clear
        effect(:clear)
      end

      def desaturate
        # http://refiddle.com/18rj
        gsub /\e\[\d+(;\d+)*m/, ''
      end

      def colors
        @colors ||= COLORS.keys.sort
      end

      def effect(effect_name)
        effect_name = effect_name.to_sym if effect_name
        "\e[#{EFFECTS[effect_name]}m" if EFFECTS[effect_name]
      end

      def color(color_name)
        background = (color_name.to_s =~ /on_/)
        color_name = color_name.to_s.sub('on_', '').to_sym
        return unless color_name && COLORS[color_name]
        "\e[#{COLORS[color_name] + (background ? 10 : 0)}m"
      end
    end
  end
end
