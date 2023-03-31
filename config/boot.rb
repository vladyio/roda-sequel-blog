# frozen_string_literal: true

require "bundler/setup"

require_relative "application_settings"

# Require initializers after "application_settings" but before
# "application_loader", so that nothing breaks during code (re)loads
Dir["#{__dir__}/initializers/*.rb"].each { |f| require f }

require_relative "application_loader"
