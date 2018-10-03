# frozen_string_literal: true

require 'logger'

module LiteCable
  class ConfigSetup
    class <<self
      attr_reader :defaults, :config_attributes

      def config_name(val = nil)
        return (@config_name = val.to_s) unless val.nil?
      end

      def attr_config(*args, **kwargs)
        @defaults ||= {}
        @config_attributes ||= []

        new_defaults = kwargs.deep_dup
        new_defaults.stringify_keys!
        defaults.merge!(new_defaults)

        new_keys = (args + new_defaults.keys) - config_attributes
        @config_attributes += new_keys
        attr_accessor(*new_keys)
      end
    end
  end

  # Anycable configuration
  class Config < LiteCable::ConfigSetup
    require "lite_cable/coders/json"
    require "lite_cable/coders/raw"

    config_name :litecable



    attr_config :logger,
                coder: Coders::JSON,
                identifier_coder: Coders::Raw,
                log_level: Logger::INFO

    def initialize
      self.class.defaults.each do |key, val|
        send("#{key}=", val)
      end
    end
  end
end
