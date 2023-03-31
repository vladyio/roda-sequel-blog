# frozen_string_literal: true

require "zeitwerk"
require "listen"

loader = Zeitwerk::Loader.new
loader.push_dir ApplicationSettings.root.join("app")
loader.enable_reloading if ApplicationSettings.env == "development"
loader.setup

if ApplicationSettings.env == "development"
  listener = Listen.to(ApplicationSettings.root.join("app")) do
    loader.reload
  end

  listener.start
end
