class Responder
  attr_reader :counter

  def initialize
    @counter = 0
  end

  def respond
    output = "Hello, World! (#{counter})."
    headers = ["http/1.1 200 ok"]

    @counter += 1
  end

  @connection.puts headers
  @connection.puts"\n"
  @connection.puts output
  @connection.close
end
