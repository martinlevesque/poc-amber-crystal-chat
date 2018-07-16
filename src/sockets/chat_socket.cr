struct ChatSocket < Amber::WebSockets::ClientSocket
  channel "*", ChatRoomChannel
  
  def on_connect
    
    p "self session?"
    p self.session
    
    true
  end
end