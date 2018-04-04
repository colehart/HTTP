class Responder
  attr_reader :counter,
              :request_lines

  def initialize
    @counter = 0
    @request_lines = []
  end

  def populate_request_lines(server_lines)
    @request_lines = server_lines
  end

  def print_header
    header = ["http/1.1 200 ok"]
    header
  end

  def respond
    output = "Hello, World! (#{counter})."
    "\n"+output
  end

  def count
    @counter += 1
  end
end
