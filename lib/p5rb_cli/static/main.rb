# p5.rb のソースコードです。
# p5.rb は p5.js の Ruby 版です。メソッド名や引数は p5.js と同じです。

def setup
  createCanvas(400, 400)
  colorMode(HSB, 360, 100, 100)
end

def draw
  background(220)
  cols = 8
  rows = 8
  w = width / cols
  h = height / rows

  (0...cols).each do |i|
    (0...rows).each do |j|
      hue = map(i + j, 0, cols + rows - 2, 0, 360)
      fill(hue, 50, 100) # Change saturation to 50 for lighter colors
      rect(i * w, j * h, w, h)
    end
  end
end