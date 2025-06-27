const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const cors = require('cors');
const app = express();
const server = http.createServer(app);
const io = new Server(server, { cors: { origin: '*' } });
app.use(cors());
app.use(express.json());

app.get('/', (req, res) => res.send('Rehearsal Organizer API running'));
// Placeholders for API routes: /users, /events, /setlists, etc.

io.on('connection', (socket) => {
  socket.on('message', (msg) => {
    io.emit('message', msg);
  });
});

const PORT = process.env.PORT || 4000;
server.listen(PORT, () => console.log(`API server running on port ${PORT}`));
