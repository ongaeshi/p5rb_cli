def setup
  createCanvas(600, 600)
  @cat = loadImage('asset/cat.png')
  @landscape = loadImage('asset/landscape.jpg')
end

def draw
  background(255)
  image(@landscape, 0, 0)
  img_width = width / 5
  img_height = height / 5
  (0...1).each do |i|
    (0...5).each do |j|
      push
      translate(i * img_width + img_width / 2, j * img_height + img_height / 2)
      rotate((i - j) * (PI / 5))
      image(@cat, -img_width / 2, -img_height / 2, img_width, img_height)
      pop
    end
  end
end
