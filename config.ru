# frozen_string_literal: true

require "roda"

class App < Roda
  route do |r|
    r.root do
      "Hello, world!"
    end
  end
end

run App.freeze.app
