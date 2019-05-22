require 'hello'

describe SayHelloToMyLittleFriend do
  it 'will run an email process for a message' do
    message_double = double :message
    message_class_double = double :message_class, new: message_double
    emailclient_class_double = double :emailclient_class, new: message_class_double

    say_hello = SayHelloToMyLittleFriend.new(emailclient_class_double)
    expect(message_double).to receive(:send)
    say_hello.run
  end
end
