# frozen_string_literal: true

require "dry/configurable"
require "dotenv"
require "pathname"

Dotenv.load("#{__dir__}/../.env")

# Allow to use app configuration with methods like this:
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
  setting :database, default: { url: "sqlite://db/#{ENV.fetch('DATABASE_NAME')}.sqlite3" }, reader: true
  setting :secret_key, default: ENV.fetch("SECRET_KEY"), reader: true
end
