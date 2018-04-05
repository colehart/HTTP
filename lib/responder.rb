require './lib/parser_module'

class Responder
  include Parser

  attr_reader :request_lines,
              :counter

  def initialize
    @total_counter = 0
    @request_lines = []
    @path = ARGV[0]
  end

  def print_header
    header = ["http/1.1 200 ok"]
  end

  def print_output
    request_words = @request_lines.map do |line|
      line.split(' ')
    end
    # output = "Hello, World! (#{@counter})."
    output = "<html><head></head><body>#{response}</body></html>"
    "\n"+output
  end

  def total_count
    @total_counter += 1
  end
end
