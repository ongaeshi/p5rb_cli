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

def setup
  createCanvas(400, 400)
  background(200)
  # noLoop
end

def draw
  background(200)
  size_factor = map(mouseX, 0, width, 0.5, 2.0)
  (0..width).step(50) do |x|
    (0..height).step(50) do |y|
      draw_wagara(x, y, size_factor)
      fill(0, 0, 255)
      rect(x + 10 * size_factor, y + 10 * size_factor, 20 * size_factor, 20 * size_factor)
      fill(255, 255, 0)
      triangle(x, y, x + 20 * size_factor, y, x + 10 * size_factor, y - 20 * size_factor)
    end
  end
end

def draw_wagara(x, y, size_factor)
  fill(255, 0, 0)
  ellipse(x, y, 40 * size_factor, 40 * size_factor)
  fill(0, 255, 0)
  ellipse(x + 20 * size_factor, y + 20 * size_factor, 20 * size_factor, 20 * size_factor)
end
