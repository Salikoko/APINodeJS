module.exports = app => {
    const classes = require("../controllers/class.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Tutorial
    router.post("/", classes.create);
  
    // Retrieve all Tutorials
    router.get("/", classes.findAll);
  
    // Retrieve all published Tutorials
    router.get("/Class/", classes.findAllByStNumber);
  
    // Retrieve a single Tutorial with id
    router.get("/:id", classes.findOne);
  
    // Update a Tutorial with id
    router.put("/:id", classes.update);
  
    // Delete a Tutorial with id
    router.delete("/:id", classes.delete);
  
    // Delete all Tutorials
    router.delete("/", classes.deleteAll);
  
    app.use('/api/classes', router);
  };
  