require 'socket'
class Server

  def initialize(port)
    @tcp_server = TCPServer.new(port)
  end

  def run
    loop do
      intro
      path = gets.chomp
      connection = @tcp_server.accept
      request_lines = populate_lines(connection)
      respond(path, request_lines, connection)
      connection.close
      exit while path == "/shutdown"
    end
    connection.shutdown(:WR)
  end

  def intro
    puts """
    Please choose a path:
    /, /hello, /datetime, or /shutdown
    """
    print ">>"
  end

  def populate_lines(connection)
    line = connection.gets.chomp
    request_lines = []
    request_lines << line
    until line.empty?
      line = connection.gets.chomp
      request_lines << line
    end
    request_lines
  end

  def respond(path, request_lines, connection)
    responder = Responder.new(request_lines)
    responder.determine_response(path)
    connection.puts responder.print_header
    connection.puts responder.print_output(path)
    responder.count_hello if path == "/hello"
    responder.count_total
  end
end
