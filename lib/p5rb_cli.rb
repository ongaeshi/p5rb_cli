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
      name += ".rb" unless name.end_with?(".rb")

      if FileTest.exist?(name)
      raise Thor::Error, "ERROR: '#{File.absolute_path(name)}' already exists"
      end
    
      File.write(name, <<~CODE)
        def setup
          createCanvas(400, 400)
          background(200)
        end

        def draw
          background(200)
          (0..width).step(50) do |x|
            (0..height).step(50) do |y|
              ellipse(x, y, 40, 40)
            end
          end
        end
      CODE
    end

    desc "run SCRIPT_FILE", "Run p5.rb script on server"
    def run_command(script_file)
      run_web_app(script_file)
    end
    map "run" => "run_command"
  end
end
