module Parser
  def response
    if @path = "/"
      """
      <pre>
      Verb: #{request_words[0][0]}
      Path: #{request_words[0][1]}
      Protocol: #{request_words[0][2]}
      Host: #{request_words[1][1].split(':')[0]}
      Port: #{request_words[1][1].split(':')[1]}
      Origin: #{request_words[1][1].split(':')[0]}
      Accept: #{request_words[6][1]}
      </pre>
      """
    elsif @path = "/hello"
      "Hello, World! (#{@counter})."
    elsif @path = "/datetime"
      "#{Time.now.strftime('%I:%M%p on %A, %B%e, %Y')}"
    elsif @path = "/shutdown"
      "Total Requests: 12"
  end
end
