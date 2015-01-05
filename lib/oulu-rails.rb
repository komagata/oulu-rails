require 'oulu-rails/version'
require 'sass'
require 'compass-rails'
require 'rgbapng'
require 'modular-scale'

module OuluRails
  class Engine < ::Rails::Engine
    initializer 'oulu_rails', after: 'compass.initialize_rails' do
      config.compass.require 'rgbapng'
      config.compass.require 'modular-scale'
    end
  end
end

module AddFunctions
  def remove_selector(string)
    assert_type string, :String
    return Sass::Script::String.new(string.value.gsub(/(\.|#)/, ""))
  end
end

module Sass::Script::Functions
  include AddFunctions
end
