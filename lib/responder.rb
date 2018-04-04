class Responder
  attr_reader :counter,
              :request_lines

  def initialize
    @counter = 0
    @request_lines = []
  end

  def populate_request_lines(request_lines)
    @request_lines = request_lines
  end

  def respond
    output = "Hello, World! (#{counter})."
    headers = ["http/1.1 200 ok"]

    @counter += 1
  end
end
