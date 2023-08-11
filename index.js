const { Client } =require("discord.js");
const client = new Client({intents: 1050624});

//process.env.TOKEN;
client.config = require("./config.json");
client
.login(client.config.token)
.then(() => {
    console.log('Client ${client.user.username} se ha iniciado');
    client.user.setActivity('rascando huevis');
}).catch((err) => console.log(err));






