# frozen_string_literal: true

# App initialization process:
#
# 1. config/boot.rb ->
# 2. config/{application_loader, application_settings}.rb ->
# 3. Zeitwerk gem autoloads the whole "app" directory
require_relative "config/boot"

# Use a Lambda object here, because Rack doesn't update a reference to the
# Zeitwerk-reloaded class instance
run ->(env) { Router.call(env) }
