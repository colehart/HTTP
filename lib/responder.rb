require './lib/parser_module'

class Responder
  include Parser

  def initialize
    @request_lines = []
    @hello_counter = 0
    @total_counter = 0
    @possible_responses = {
      "/": default_response,
      "/hello": hello_response,
      "/datetime": datetime_response,
      "/shutdown": shutdown_response
    }
  end

  def determine_response(path)
    @possible_responses[path.to_sym]
  end

  def print_header
    ["http/1.1 200 ok"]
  end

  def print_output(path)
     "\n<html><head></head><body>#{determine_response(path)}</body></html>"
  end
end
