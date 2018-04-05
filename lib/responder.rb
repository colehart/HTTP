require './lib/parser_module'

class Responder
  include Parser

  def initialize
    @request_lines = []
    @hello_counter = 0
    @total_counter = 0
  end

  def print_header
    header = ["http/1.1 200 ok"]
  end

  def print_output(path)
    output =
     "<html><head></head><body>#{determine_response(path)}</body></html>"
    "\n"+output
  end
end
