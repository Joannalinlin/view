require 'tilt'

module Lotus
  module View
    class Template
      def initialize(template)
        @_template = Tilt.new(template)
      end

      def format
        @_template.basename.match(/(\.[^.]+)/).to_s.
          gsub('.', ''). # TODO shame on me, this should be part of the regex above
          to_sym
      end

      def render(scope, &blk)
        @_template.render(scope, {}, &blk)
      end
    end
  end
end
