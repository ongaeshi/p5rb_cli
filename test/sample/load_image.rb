def setup
  createCanvas(600, 600)
  @img = loadImage('asset/cat.png')
end

def draw
  background(255)
  img_width = width / 5
  img_height = height / 5
  (0...5).each do |i|
    (0...5).each do |j|
      push
      translate(i * img_width + img_width / 2, j * img_height + img_height / 2)
      rotate((i - j) * (PI / 5))
      image(@img, -img_width / 2, -img_height / 2, img_width, img_height)
      pop
    end
  end
end