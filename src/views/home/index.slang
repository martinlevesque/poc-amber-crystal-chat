.row
  #logo
  .col-sm-12.col-md-6
    h2 = "Welcome !"


.row
  table#main_table
    tr
      th Username
      th Msg
    
    - messages.each do |message|
      tr
        td = message.username
        td = message.message
      
.row
  form
    .col-xs-4
      input type="text" id="username" placeholder="username"
    .col-xs-4 
      input type="text" id="msg" placeholder="Msg"
    .col-xs-4 
      input type="button" id="msg" value="Send" onclick="sendMsg()"

script src="/amber.min.js"

javascript:

  let socket = new Amber.Socket('/chat');
  let channel;
  const channelName = "#{channel}";

  function sendMsg() {
    const username = document.getElementById('username').value;
    const msg = document.getElementById('msg').value;
  
    channel.push('message_new', { username, msg });
  }

  socket.connect().then(function() {
    console.log("connected!")
    
    channel = socket.channel(channelName);
    
    channel.join();
    
    channel.on('message_new', function(payload) {
      const limitTable = 15;
    
      const table = document.getElementById("main_table");
      const row = table.insertRow(1);
      row.insertCell(0).innerHTML = payload.username;
      row.insertCell(1).innerHTML = payload.msg;
      
      table.deleteRow(limitTable + 1);
    });
  });
  