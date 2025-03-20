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
        # p5.rb - A Ruby implementation of p5.js
        #
        # This library allows you to create sketches using Ruby, similar to p5.js.
        # 
        # - Define `setup` and `draw` method to create a sketch.
        # - API is compatible with p5.js.
        # - API naming follows PascalCase for consistency with p5.js.
        #
        # Example:
        # def setup
        #   createCanvas(400, 400)
        # end
        #
        # def draw
        #   background(220)
        #   ellipse(200, 200, 50, 50)
        # end
        #
        # --- Major Methods ---
        #
        # - createCanvas(width, height) -> Creates a drawing canvas.
        # - background(color) -> Sets the background color.
        # - fill(color) -> Sets the fill color for shapes.
        # - stroke(color) -> Sets the outline color for shapes.
        # - noStroke() -> Disables shape outlines.
        # - ellipse(x, y, w, h) -> Draws an ellipse at (x, y) with width w and height h.
        # - rect(x, y, w, h) -> Draws a rectangle at (x, y) with width w and height h.
        # - line(x1, y1, x2, y2) -> Draws a line from (x1, y1) to (x2, y2).
        # - text(str, x, y) -> Draws text at (x, y).
        # - push() -> Saves the current drawing state (transformation, styles, etc.).
        # - pop() -> Restores the last saved drawing state.
        # - width, height -> Returns the canvas dimensions.
        # - frameCount -> Returns the number of frames elapsed.
        # - mouseX, mouseY -> Returns the current mouse position.
        # - keyPressed? -> Returns true if a key is pressed.
        # - mousePressed? -> Returns true if the mouse button is pressed.     

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
