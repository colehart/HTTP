require 'socket'

class Server
  def initialize(port)
    @tcp_server = TCPServer.new(port)
    @connection = nil
    @responder = Responder.new
  end

  def start
    loop do # not sure when it would end
      @connection = @tcp_server.accept
      populate_lines
      create_response
      @connection.close
    end
  end

  def populate_lines
    line = @connection.gets.chomp
    until line.empty?
      line = @connection.gets.chomp
      @responder.request_lines << line
    end
    p @responder.request_lines
  end

  def create_response
    @connection.puts @responder.print_header
    @connection.puts @responder.print_output
    @responder.count
  end

  # def close_connection
  #   @connection.close #will do later with shutdown. as of iter0, returns nil and breaks for iterating counter.
  # end
end
