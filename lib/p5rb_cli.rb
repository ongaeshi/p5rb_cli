# frozen_string_literal: true

require_relative "p5rb_cli/version"
require "thor"
require "fileutils"

module P5rbCli
  class Cli < Thor
    def self.exit_on_failure?
      true
    end
  
    desc "new NAME", "Create a new p5rb script"
    def new(name)
      if FileTest.exist?(name)
        raise Thor::Error, "ERROR: '#{File.absolute_path(name)}' already exists"
      end
  
      p name
    end
  end
end
