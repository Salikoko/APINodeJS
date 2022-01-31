const Class = require("../models/class.model.js");

// Create and Save a new Class
exports.create = (req, res) => {
  // Validate request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }

  // Create a Class
  const cLass = new Class({
    ID_class: req.body.ID_class,
    Class_Name: req.body.Class_Name,
    Students_Number: req.body.Students_Number,
    AVG_Grades: req.body.AVG_Grades
  });

  // Save Class in the database
  Class.create(cLass, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the Student."
      });
    else res.send(data);
  });
};

// Retrieve all Class from the database (with condition).
exports.findAll = (req, res) => {
  const Name = req.query.Name;

  Class.getAll(Name, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving tutorials."
      });
    else res.send(data);
  });
};

// Find a single Class by Id
exports.findOne = (req, res) => {
  Class.findById(req.params.id, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found Class with id ${req.params.id}.`
        });
      } else {
        res.status(500).send({
          message: "Error retrieving Class with id " + req.params.id
        });
      }
    } else res.send(data);
  });
};

// find all published 
exports.findAllByStNumber = (req, res) => {
  Class.getAllByStNumber(req.query.Class, (err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving Class."
      });
    else res.send(data);
  });
};

// Update a Class identified by the id in the request
exports.update = (req, res) => {
  // Validate Request
  if (!req.body) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
  }

  console.log(req.body);

  Class.updateById(
    req.params.id,
    new Class(req.body),
    (err, data) => {
      if (err) {
        if (err.kind === "not_found") {
          res.status(404).send({
            message: `Not found Class with id ${req.params.ID_class}.`
          });
        } else {
          res.status(500).send({
            message: "Error updating Class with id " + req.params.ID_class

          });
        }
      } else res.send(data);
    }
  );
};

// Delete a Class with the specified id in the request
exports.delete = (req, res) => {
  Class.remove(req.params.id, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found Class with id ${req.params.id}.`
        });
      } else {
        res.status(500).send({
          message: "Could not delete Class with id " + req.params.id
        });
      }
    } else res.send({ message: `Class was deleted successfully!` });
  });
};

// Delete all Classes from the database.
exports.deleteAll = (req, res) => {
  Class.removeAll((err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || "Some error occurred while removing all classes."
      });
    else res.send({ message: `All classes were deleted successfully!` });
  });
};
