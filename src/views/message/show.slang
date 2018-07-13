h1 Show Message
p = message.username
p = message.channel
p = message.message
p
  == link_to("back", "/messages", class: "btn btn-light btn-sm")
  == link_to("edit", "/messages/#{message.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/messages/#{message.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
