# frozen_string_literal: true

require_relative "p5rb_cli/version"
require_relative "p5rb_cli/web_app"
require "thor"
require "fileutils"

module P5rbCli
  class Cli < Thor
    def self.exit_on_failure?
      true
    end
  
    desc "new NAME", "Create a new p5.rb script"
    def new(name)
      if FileTest.exist?(name)
        raise Thor::Error, "ERROR: '#{File.absolute_path(name)}' already exists"
      end
  
      p name
    end

    desc "run SCRIPT_FILE", "Run p5.rb script on server"
    def run_command(script_file)
      run_web_app(script_file)
    end
    map "run" => "run_command"
  end
end
