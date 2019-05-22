class EmailClient
  def initialize(message_class = Message)
    @message_class = message_class
  end

  def message
    @message_class.new
  end
end

class Message
  def send(to, body)
    # Imagine I'm sending an email
  end
end

class SayHelloToMyLittleFriend
  def initialize(emailclient_class = EmailClient)
    @emailclient_class = emailclient_class
  end

  def run
    email = @emailclient_class.new
    email.message.send(
      "friend@example.com",
      "HELLO!"
    )
  end
end
