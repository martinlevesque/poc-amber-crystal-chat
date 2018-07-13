struct ChatSocket < Amber::WebSockets::ClientSocket
  channel "*", ChatRoomChannel
  
  def on_connect
    # returning true accept all connections
    # you can use authentication here
    true
  end
end