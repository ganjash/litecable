// var WebSocketClient = require('websocket').client;
// var client = new WebSocketClient();
// var user = "sri"+socketId;

// client.connect("ws://localhost:9292/cable");
var actioncable = require('actioncable-nodejs')

socketMethod = () => {
    var socketId = Date.now();
    var roomId = "201";
    var wsSocket = "ws://localhost:9292/cable?sid="+socketId;
    
    let cable_url = wsSocket
    let cable = new actioncable(cable_url, {
        origin: 'http://localhost:9292'
    })
    let subscription = cable.subscribe('chat',{
     connected() {
        console.log('connected')
        },
     disconnected() {
        console.log("disconnected");
        },
     rejected() {
        console.log("rejected");
       },
     received(data) {
        console.log("Received", data);
        }
     });

}
for(var i=1; i <= 1000; i++) {
    setTimeout(() => {
        socketMethod()
    }, i*100)
}
