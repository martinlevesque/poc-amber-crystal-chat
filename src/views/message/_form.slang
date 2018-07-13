- if message.errors
  ul.errors
    - message.errors.each do |error|
      li = error.to_s

== form(action: "/messages/#{message.id.to_s}", method: message.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "username", value: message.username, placeholder: "Username", class: "form-control")
  .form-group
    == text_field(name: "channel", value: message.channel, placeholder: "Channel", class: "form-control")
  .form-group
    == text_field(name: "message", value: message.message, placeholder: "Message", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("back", "/messages", class: "btn btn-light btn-sm")
