require 'socket'

class Server
  def initialize(port)
    @tcp_server = TCPServer.new(port)
    @connection = nil
  end

  def start
    responder = Responder.new
    loop do # not sure when it would end
      @connection = @tcp_server.accept
      line = @connection.gets.chomp
      until line.empty?
        line = @connection.gets.chomp
        @request_lines << line
      end
      @request_lines.inspect
    end

    @connection.puts responder.print_header
    @connection.puts responder.respond
    responder.count

    close_connection
  end

  def close_connection
    @connection.close
  end
end
