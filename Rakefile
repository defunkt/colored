# frozen_string_literal: false

require 'bundler'
require 'bundler/gem_tasks'
require 'rake/clean'

CLEAN.include %w(pkg coverage *.gem)

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError => e
  warn "Error loading task: #{e.message}"
  exit 1
end

task default: [:spec]
