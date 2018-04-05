require './lib/parser_module'

class Responder
  include Parser

  attr_reader :request_lines,
              :counter

  def initialize
    @request_lines = []
    @hello_counter = 0
    @total_counter = 0
  end

  def determine_response
    if @path = "/"
      default_response
    elsif @path = "/hello"
      "Hello, World! (#{@hello_counter})."
      count_hello
    elsif @path = "/datetime"
      "#{Time.now.strftime('%I:%M%p on %A, %B%e, %Y')}"
    elsif @path = "/shutdown"
      "Total Requests: #{@total_counter})"
    end
  end

  def print_header
    header = ["http/1.1 200 ok"]
  end

  def print_output
    # request_words = @request_lines.map do |line|
    #   line.split(' ')
    end
    output =
    count_total
     "<html><head></head><body>#{determine_response}</body></html>"
    "\n"+output
  end

  def count_hello
    @hello_counter += 1
  end

  def count_total
    @total_counter += 1
  end
end
