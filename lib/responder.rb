class Responder
# Generating a response
  counter = 0
  loop do
    output = "Hello, World! (#{counter})."
    headers = ["http/1.1 200 ok"]

    counter += 1
  end
end
