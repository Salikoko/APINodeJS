const sql = require("./db.js");

// constructor
const Class = function(cLass) {
  this.ID_class = cLass.ID_class;
  this.Class_Name = cLass.Class_Name;
  this.Students_Number = cLass.Students_Number;
  this.AVG_Grades = cLass.AVG_Grades;
};

Class.create = (newClass, result) => {
  sql.query("INSERT INTO Class SET ?", newClass, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("created student: ", { id: res.insertId, ...newClass });
    result(null, { id: res.insertId, ...newClass });
  });
};

Class.findById = (id, result) => {
  sql.query(`SELECT * FROM Class WHERE ID_class = ${id}`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      console.log("found class: ", res[0]);
      result(null, res[0]);
      return;
    }

    // not found Class with the id
    result({ kind: "not_found" }, null);
  });
};

Class.getAll = (ClassName, result) => {
  let query = "SELECT * FROM Class";

  if (ClassName) {
    query += ` WHERE Class_Name LIKE '%${ClassName}%'`;
  }

  sql.query(query, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log("Classes: ", res);
    result(null, res);
  });
};

Class.getAllByStNumber = (Number,result) => {
  let query = "SELECT * FROM Class";

  if(Number){
    query+= ` WHERE Students_Number LIKE '%${Number}%'`;
  }
  sql.query(query, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log("Class: ", res);
    result(null, res);
  });
};

Class.updateById = (id, cLass, result) => {
  sql.query(
    "UPDATE Class SET Class_Name = ?, Students_Number = ?, AVG_Grades = ? WHERE ID_Class = ?",
    [cLass.Class_Name, cLass.Students_Number, cLass.AVG_Grades, id],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }

      if (res.affectedRows == 0) {
        // not found Class with the id
        result({ kind: "not_found" }, null);
        return;
      }

      console.log("updated Class: ", { id: id, ...cLass });
      result(null, { id: id, ...cLass });
    }
  );
};

Class.remove = (id, result) => {
  sql.query("DELETE FROM Class WHERE ID_class = ?", id, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    if (res.affectedRows == 0) {
      // not found Class with the id
      result({ kind: "not_found" }, null);
      return;
    }

    console.log("deleted student with id: ", id);
    result(null, res);
  });
};

Class.removeAll = result => {
  sql.query("DELETE FROM Class", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log(`deleted ${res.affectedRows} classes`);
    result(null, res);
  });
};

module.exports = Class;
