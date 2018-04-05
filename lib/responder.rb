class Responder
  include Parser
  def initialize
    @counter = 0
  end

  # def response
  #   "<pre>" + @parser.request_lines.join["\n"] + "</pre>"
  # end

  def print_header
    header = ["http/1.1 200 ok"]
  end

  def print_output
    parser = Parser.new

    # output = "Hello, World! (#{@counter})."
    response = "<html><head></head><body>#{parser.response}</body></html>"
    "\n"+output
  end

  def count
    @counter += 1
  end
end
