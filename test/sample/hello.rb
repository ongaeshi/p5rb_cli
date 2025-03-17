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
