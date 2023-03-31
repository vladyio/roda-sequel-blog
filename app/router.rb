# frozen_string_literal: true

require "roda"

class Router < Roda
  route do |r|
    r.root do
      "Hello, world!"
    end
  end
end
