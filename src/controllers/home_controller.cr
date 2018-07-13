class HomeController < ApplicationController
  def index
    channel = "home"
    messages = Message.all("WHERE channel = ?", [channel])
    
    render("index.slang")
  end
  
  def custom_channel
    channel = params["id"]
    messages = Message.all("WHERE channel = ?", [channel])
    render("index.slang")
  end
end
