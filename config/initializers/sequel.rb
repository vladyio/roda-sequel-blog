# frozen_string_literal: true

require "sequel"

DB = Sequel.connect(ApplicationSettings.database[:url])

Sequel::Model.plugin :timestamps
Sequel::Model.plugin :forme_set
