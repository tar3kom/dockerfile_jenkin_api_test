var express = require('express');
var app = express();

// set the view engine to ejs
app.set('view engine', 'ejs');

// use res.render to load up an ejs view file

// index page
app.get('/', function(req, res) {
  res.render('pages/index');
});

// about page
app.get('/about', function(req, res) {
  res.render('pages/about');
});

app.get('/api', function(req, res) {
  res.json({"message":"hello world"})
});

app.listen(4000);
console.log('Server is listening on port 4000');