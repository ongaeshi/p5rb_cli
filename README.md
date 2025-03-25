# p5.rb CLI

p5.rb CLI is a command-line tool that makes it easy to start creative coding with Ruby, inspired by p5.js. Create interactive animations and visual art using Ruby's simple and elegant syntax.

## Installation

```bash
gem install p5rb_cli
```

## Usage

After installation, you can use the following commands:

### Create a New Sketch

```bash
p5rb new <NAME>
```

This command generates a new p5.rb sketch in the specified directory. The generated sketch includes basic setup and sample code.

### Run a Sketch

```bash
p5rb run <SCRIPT_FILE>
```

This command runs the specified sketch on a local server and displays it in your browser. The browser automatically updates when you make changes to your code.

### Other Commands

To see detailed usage information:

```bash
p5rb help
```

## Sample Code

```ruby
def setup
  createCanvas(400, 400)
  background(220)
end

def draw
  fill(255, 0, 0)
  circle(mouseX, mouseY, 50)
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at the [p5rb_cli repository](https://github.com/ongaeshi/p5rb_cli).

## License

This project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
