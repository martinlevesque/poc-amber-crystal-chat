.row
  .col-sm-11
    h2 Messages
  .col-sm-1
    a.btn.btn-success.btn-sm href="/messages/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Username
        th Channel
        th Message
        th Actions
    tbody
      - messages.each do |message|
        tr
          td = message.username
          td = message.channel
          td = message.message
          td
            span
              == link_to("read", "/messages/#{message.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/messages/#{message.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/messages/#{ message.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
