require 'socket'
tcp_server = TCPServer.new(9292)
counter = 0
loop do
  connection = tcp_server.accept
  request_lines = []
  line = connection.gets.chomp
  until line.empty?
    line = connection.gets.chomp
    request_lines << line
  end
  request_lines.inspect
  output = "Hello, World! (#{counter})."
  headers = ["http/1.1 200 ok"]
  connection.puts headers
  connection.puts"\n"
  connection.puts output
  connection.close
  counter += 1
end
