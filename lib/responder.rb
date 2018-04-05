class Responder
  def initialize
    @counter = 0
    @parser = Parser.new
  end

  # def response
  #   "<pre>" + @parser.request_lines.join["\n"] + "</pre>"
  # end

  def print_header
    header = ["http/1.1 200 ok"]
  end

  def print_output
    output = "<html><head></head><body>#{@parser.parse_lines}</body></html>"
    "Hello, World! (#{@counter})."
    "\n"+output
  end

  def count
    @counter += 1
  end
end
