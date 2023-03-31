# frozen_string_literal: true

require "bundler/setup"
require "sequel/core"
require "sequel_tools"
require_relative "config/application_settings"

db = Sequel.connect(ApplicationSettings.database[:url], test: false, keep_reference: false)

base_config = SequelTools.base_config(
  project_root: ApplicationSettings.root,
  dbadapter: db.opts[:adapter],
  dbname: db.opts[:database],
  username: db.opts[:username].to_s,
  password: db.opts[:password].to_s
)

task default: :start

task :start do |_t|
  system("bundle exec puma")
end

namespace :db do
  SequelTools.inject_rake_tasks(
    base_config.merge(log_level: :info, sql_log_level: :info),
    self
  )
end
