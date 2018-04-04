class Sender
  #Sending the response to the user
  @connection.puts headers
  @connection.puts"\n"
  @connection.puts output
  @connection.close
end
