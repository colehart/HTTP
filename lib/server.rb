require 'socket'
require 'pry'
class Server
  attr_reader :path

  def initialize(port)
    @tcp_server = TCPServer.new(port)
    @connection = nil
    @responder = Responder.new
  end

  def run
    loop do
      puts """
      Please choose a path:
      /, /hello, /datetime, or /shutdown
      """
      print ">>"
      path = gets.chomp
      @connection = @tcp_server.accept
      populate_lines
      respond(path)
      @connection.close
    end
  end

  def populate_lines
    line = @connection.gets.chomp
    @responder.request_lines << line
    until line.empty?
      line = @connection.gets.chomp
      @responder.request_lines << line
    end
  end

  def respond(path)
    @responder.determine_response(path)
    @connection.puts @responder.print_header
    @connection.puts @responder.print_output(path)
    @responder.count_total
  end

  # def close_connection
  #   @connection.close #will do later with shutdown. as of iter0, returns nil and breaks for iterating counter.
  # end
end
