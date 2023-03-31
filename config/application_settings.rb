# frozen_string_literal: true

require "dry/configurable"
require "pathname"

#
# Allow to configure the application by methods like this:
#     ```
#     ApplicationSettings.root = "#{__dir__}/.."
#     ApplicationSettings.env = "development"
#     ```
class ApplicationSettings
  extend Dry::Configurable

  setting :root, default: "#{__dir__}/..",
                 constructor: ->(path) { Pathname.new(path).expand_path },
                 reader: true

  setting :env, default: ENV.fetch("RACK_ENV", "development"), reader: true
end
