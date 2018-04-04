require 'socket'

class Server
  def initialize(port)
    @tcp_server = TCPServer.new(port)
    @connection = nil
    start
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

    @connection.puts responder.respond

    @connection.close
  end
end
