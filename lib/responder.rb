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

  def respond
    output = "Hello, World! (#{counter})."
    headers = ["http/1.1 200 ok"]
    @counter += 1

    "#{headers}" + "\n" + output
  end
end
