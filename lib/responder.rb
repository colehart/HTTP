require './lib/parser_module'

class Responder
  include Parser

  attr_reader :request_lines

  def initialize
    @counter = 0
    @request_lines = []
  end

  def print_header
    header = ["http/1.1 200 ok"]
  end

  def print_output
    # output = "Hello, World! (#{@counter})."
    output = "<html><head></head><body>#{response}</body></html>"
    "\n"+output
  end

  def count
    @counter += 1
  end
end
