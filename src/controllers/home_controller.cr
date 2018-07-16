class HomeController < ApplicationController
  
  def index
    channel = "home"
    messages = Message.all("WHERE channel = ? ORDER BY id DESC LIMIT 15", [channel])
    
    render("index.slang")
  end
  
  def custom_channel
    channel = params["id"]
    messages = Message.all("WHERE channel = ? ORDER BY id DESC LIMIT 15", [channel])
    
    render("index.slang")
  end
  
  
  def set_username
    self.session["username"] = params["username"]
  end
  
  private def prepare_channel(channel)
    
    #{
    #  "messages" => messages,
    #  "username" => self.session["username"]
    #}
  end
end
