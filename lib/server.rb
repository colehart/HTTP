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
      puts "Please choose a path:\n'/', '/hello', '/datetime', or '/shutdown'"
      print ">>"
      path = gets.chomp
      @connection = @tcp_server.accept
      populate_lines
      respond(path)
      @connection.close
      exit while path == "/shutdown"
    end
    @connection.shutdown(:WR)
  end

  def choose_path

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
    path == "/hello" ? (@responder.count_hello & @responder.count_total) : @responder.count_total
  end
end
