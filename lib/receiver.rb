require 'socket'

class Receiver
  def initialize(port)
    @tcp_server = TCPServer.new(port)
  end

  def start
    loop do
      connection = @tcp_server.accept
      request_lines = []
      line = connection.gets.chomp
      until line.empty?
        line = connection.gets.chomp
        request_lines << line
      end
      request_lines.inspect

      connection.puts headers
      connection.puts"\n"
      connection.puts output
      connection.close
    end
  end
end
