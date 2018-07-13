class MessageController < ApplicationController
  def index
    messages = Message.all
    render("index.slang")
  end

  def show
    if message = Message.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Message with ID #{params["id"]} Not Found"
      redirect_to "/messages"
    end
  end

  def new
    message = Message.new
    render("new.slang")
  end

  def create
    message = Message.new(message_params.validate!)

    if message.valid? && message.save
      flash["success"] = "Created Message successfully."
      redirect_to "/messages"
    else
      flash["danger"] = "Could not create Message!"
      render("new.slang")
    end
  end

  def edit
    if message = Message.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Message with ID #{params["id"]} Not Found"
      redirect_to "/messages"
    end
  end

  def update
    if message = Message.find(params["id"])
      message.set_attributes(message_params.validate!)
      if message.valid? && message.save
        flash["success"] = "Updated Message successfully."
        redirect_to "/messages"
      else
        flash["danger"] = "Could not update Message!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Message with ID #{params["id"]} Not Found"
      redirect_to "/messages"
    end
  end

  def destroy
    if message = Message.find params["id"]
      message.destroy
    else
      flash["warning"] = "Message with ID #{params["id"]} Not Found"
    end
    redirect_to "/messages"
  end

  def message_params
    params.validation do
      required(:username) { |f| !f.nil? }
      required(:channel) { |f| !f.nil? }
      required(:message) { |f| !f.nil? }
    end
  end
end
