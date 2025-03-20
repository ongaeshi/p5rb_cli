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
  colorMode(HSB, 360, 100, 100)
end

def draw
  noStroke
  fill(0, 100, 100) # Ruby red base color

  # Draw the ruby shape (polygon resembling a gem)
  push
  translate(200, 200) # Move to the center of the canvas
  rotate(-PI / 4) # Rotate 45 degrees counterclockwise (left diagonal)
  translate(-200, -200) # Move back to the original position

  beginShape
  vertex(200, 100) # Top point
  vertex(275, 150) # Top-right
  vertex(255, 250) # Bottom-right
  vertex(145, 250) # Bottom-left
  vertex(125, 150) # Top-left
  endShape(CLOSE)
  pop

  # Draw faces in a tile pattern
  fill(0, 80, 80) # Red color for the faces
  noStroke

  # Tile pattern positions
  (50..350).step(50).each do |x|
    (50..350).step(50).each do |y|
      push
      translate(x, y) # Move to the tile position
      rotate(-PI / 4) # Rotate 45 degrees counterclockwise
      translate(-x, -y) # Move back to the original position

      # Face (ruby shape)
      beginShape
      vertex(x, y - 20) # Top point
      vertex(x + 15, y - 10) # Top-right
      vertex(x + 10, y + 10) # Bottom-right
      vertex(x - 10, y + 10) # Bottom-left
      vertex(x - 15, y - 10) # Top-left
      endShape(CLOSE)

      # Eyes
      fill(0) # Black color for the eyes
      ellipse(x - 5, y - 5, 3, 3) # Left eye
      ellipse(x + 5, y - 5, 3, 3) # Right eye

      # Nose
      fill(30, 100, 100) # Orange color for the carrot nose
      triangle(x, y, x + 3, y + 2, x - 3, y + 2)
      pop
    end
  end
end
