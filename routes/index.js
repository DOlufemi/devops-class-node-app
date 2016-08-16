var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.send("<h1>SO, I'M RUNNING IN A DOCKER CONTAINER? WOW.</h1>");
});

module.exports = router;
