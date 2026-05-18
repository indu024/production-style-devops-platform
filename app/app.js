const express = require('express');
const path = require('path');

const app = express();

app.use(express.static('public'));

app.get('/api/message', (req, res) => {
  res.json({
    message: 'DevOps Full Stack App Running in Kubernetes'
  });
});

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(3000, () => {
  console.log('Server started on port 3000');
});