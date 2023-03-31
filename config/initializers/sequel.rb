# frozen_string_literal: true

require "sequel"

DB = Sequel.connect(ApplicationSettings.database[:url])
