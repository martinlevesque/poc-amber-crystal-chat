class ChatRoomChannel < Amber::WebSockets::Channel
  def handle_message(client_socket, msg)
    p "handling message"
    p msg
    
    begin
      Message.new( 
        username: msg["payload"]["username"], 
        message: msg["payload"]["msg"],
        channel: msg["topic"]
      ).save
      
      rebroadcast!(msg)
    rescue ex
      puts ex.message
    end
    
  end
end