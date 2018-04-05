require './lib/parser_module'

class Responder
  include Parser

  def initialize
    @request_lines = []
    @hello_counter = 0 #still need right counter method call time
    @total_counter = 0
  end

  def print_header
    ["http/1.1 200 ok"]
  end

  def print_output(path)
     "\n<html><head></head><body>#{determine_response(path)}</body></html>"
     # while path == "/hello" do
     #   count_hello
     # end
  end
end
