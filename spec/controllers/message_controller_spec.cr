require "./spec_helper"

def message_hash
  {"username" => "Fake", "channel" => "Fake", "message" => "Fake"}
end

def message_params
  params = [] of String
  params << "username=#{message_hash["username"]}"
  params << "channel=#{message_hash["channel"]}"
  params << "message=#{message_hash["message"]}"
  params.join("&")
end

def create_message
  model = Message.new(message_hash)
  model.save
  model
end

class MessageControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe MessageControllerTest do
  subject = MessageControllerTest.new

  it "renders message index template" do
    Message.clear
    response = subject.get "/messages"

    response.status_code.should eq(200)
    response.body.should contain("messages")
  end

  it "renders message show template" do
    Message.clear
    model = create_message
    location = "/messages/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Message")
  end

  it "renders message new template" do
    Message.clear
    location = "/messages/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Message")
  end

  it "renders message edit template" do
    Message.clear
    model = create_message
    location = "/messages/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Message")
  end

  it "creates a message" do
    Message.clear
    response = subject.post "/messages", body: message_params

    response.headers["Location"].should eq "/messages"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a message" do
    Message.clear
    model = create_message
    response = subject.patch "/messages/#{model.id}", body: message_params

    response.headers["Location"].should eq "/messages"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a message" do
    Message.clear
    model = create_message
    response = subject.delete "/messages/#{model.id}"

    response.headers["Location"].should eq "/messages"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
