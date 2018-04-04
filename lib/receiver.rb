require 'socket'

class Receiver
  attr_reader :connection,
              :request_lines

  def initialize(port)
    @tcp_server = TCPServer.new(port)
    @connection = nil
    @request_lines = []
  end

  def start
    # loop do #not sure when it would end
      @connection = @tcp_server.accept
      line = @connection.gets.chomp
      until line.empty?
        line = @connection.gets.chomp
        @request_lines << line
      end
      
    # end
  end
end
