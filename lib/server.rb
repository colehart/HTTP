require 'socket'

class Server
  attr_reader :connection,
              :request_lines

  def initialize(port)
    @tcp_server = TCPServer.new(port)
    @connection = nil
    @request_lines = []
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
  end

  @connection.puts headers
  @connection.puts"\n"
  @connection.puts output
  @connection.close

end
