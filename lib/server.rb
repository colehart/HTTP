require 'socket'

class Server
  def initialize(port)
    @tcp_server = TCPServer.new(port)
    @connection = nil
    @parser = Parser.new
    @responder = Responder.new
  end

  def run
    loop do
      @connection = @tcp_server.accept
      populate_lines
      respond
      @connection.close
    end
  end

  def populate_lines
    line = @connection.gets.chomp
    @parser.request_lines << line
    until line.empty?
      line = @connection.gets.chomp
      @parser.request_lines << line
    end
    @parser.parse_lines
  end

  def respond
    @connection.puts @responder.print_header
    @connection.puts @responder.print_output
    @responder.count
  end

  # def close_connection
  #   @connection.close #will do later with shutdown. as of iter0, returns nil and breaks for iterating counter.
  # end
end
